#!/bin/bash

# fetch-image.sh
# Unsplash API から画像を自動取得し、assets/images/ に保存する

set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# 1. 環境変数の読み込み
# ─────────────────────────────────────────────────────────────────────────────
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_ROOT=$(cd "${SCRIPT_DIR}/.." && pwd)

if [ -f "${REPO_ROOT}/.env" ]; then
  # shellcheck disable=SC1090
  export $(grep -v '^#' "${REPO_ROOT}/.env" | xargs)
fi

ACCESS_KEY="${UNSPLASH_ACCESS_KEY:-}"
if [ -z "${ACCESS_KEY}" ]; then
  echo "[ERROR] UNSPLASH_ACCESS_KEY が設定されていません。"
  echo "        .env ファイルを作成し、APIキーを記入してください。"
  exit 1
fi

# ─────────────────────────────────────────────────────────────────────────────
# 2. 引数の処理
# ─────────────────────────────────────────────────────────────────────────────
# 使い方: fetch-image.sh <keyword> [count] [basename] [orientation]
KEYWORD="${1:-}"
COUNT="${2:-1}"
BASENAME="${3:-}"
ORIENTATION="${4:-landscape}"

if [ -z "${KEYWORD}" ]; then
  echo "使い方: $0 <keyword> [count] [basename] [orientation]"
  exit 1
fi

# BASENAME が未指定の場合はキーワードから生成
if [ -z "${BASENAME}" ]; then
  BASENAME=$(echo "${KEYWORD}" | tr ' ' '-' | tr -cd '[:alnum:]-')
fi

IMAGE_DIR="${REPO_ROOT}/assets/images"
CREDITS_FILE="${IMAGE_DIR}/CREDITS.md"
mkdir -p "${IMAGE_DIR}"

# ─────────────────────────────────────────────────────────────────────────────
# 3. 画像の取得
# ─────────────────────────────────────────────────────────────────────────────
echo "[INFO]  Unsplash から画像を検索中: \"${KEYWORD}\" (向き: ${ORIENTATION})"

# クレジットファイルの初期化（なければ作成）
if [ ! -f "${CREDITS_FILE}" ]; then
  echo "# Image Credits" > "${CREDITS_FILE}"
  echo "取得した画像の出典情報です。" >> "${CREDITS_FILE}"
  echo "" >> "${CREDITS_FILE}"
fi

for i in $(seq 1 "${COUNT}"); do
  # 保存ファイル名の決定
  if [ "${COUNT}" -eq 1 ]; then
    TARGET_NAME="${BASENAME}.jpg"
  else
    TARGET_NAME="${BASENAME}-${i}.jpg"
  fi
  TARGET_PATH="${IMAGE_DIR}/${TARGET_NAME}"

  # API 呼び出し（ランダムな1枚を取得）
  RESPONSE=$(curl -s "https://api.unsplash.com/photos/random?query=${KEYWORD// /%20}&orientation=${ORIENTATION}&client_id=${ACCESS_KEY}")

  # エラーチェック
  if echo "${RESPONSE}" | jq -e '.errors' > /dev/null; then
    ERROR_MSG=$(echo "${RESPONSE}" | jq -r '.errors[0]')
    echo "[ERROR] APIエラー: ${ERROR_MSG}"
    exit 1
  fi

  # 必要な情報の抽出
  IMAGE_URL=$(echo "${RESPONSE}" | jq -r '.urls.regular')
  USER_NAME=$(echo "${RESPONSE}" | jq -r '.user.name')
  USER_LINK=$(echo "${RESPONSE}" | jq -r '.user.links.html')
  PHOTO_LINK=$(echo "${RESPONSE}" | jq -r '.links.html')

  # 画像のダウンロード
  echo "[INFO]  ダウンロード中 (${i}/${COUNT}): ${TARGET_NAME}"
  curl -s -L "${IMAGE_URL}" -o "${TARGET_PATH}"

  # クレジットの記録
  echo "- **${TARGET_NAME}**: Photo by [${USER_NAME}](${USER_LINK}) on [Unsplash](${PHOTO_LINK})" >> "${CREDITS_FILE}"
done

echo "[OK]    画像の取得が完了しました → ${IMAGE_DIR}"
