#!/bin/bash

# build.sh
#
# MarpのMarkdownファイルをPDFおよびHTML形式に変換するスクリプト
#
# 使い方:
#   ./build.sh <markdown_file>
#
# 例:
#   ./build.sh slide-deck.md
#
# 依存関係:
#   - marp-cli: `npm install -g @marp-team/marp-cli` でインストールしてください
#   - カスタムテーマ用のローカル `style.css` ファイル

# --- 設定 ---
INPUT_FILE=$1
# 入力ファイルが指定されていない場合は終了
if [ -z "${INPUT_FILE}" ]; then
    echo "エラー: 入力Markdownファイルが指定されていません。"
    echo "使い方: $0 <markdown_file>"
    exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_ROOT=$(cd "${SCRIPT_DIR}/.." && pwd)

OUTPUT_NAME=$(basename "${INPUT_FILE}" .md)
OUTPUT_DIR="${REPO_ROOT}/dist"
BASE_CSS_FILE="${REPO_ROOT}/themes/base.css"
PROJECT_CSS_FILE="${REPO_ROOT}/themes/project.css"
THEME="gaia"

# --- 検証 ---
# 入力ファイルの存在確認
if [ ! -f "${INPUT_FILE}" ]; then
    echo "エラー: ファイル '${INPUT_FILE}' が見つかりません。"
    exit 1
fi

# marp-cliのインストール確認
if ! command -v marp &> /dev/null; then
    echo "エラー: 'marp' コマンドが見つかりません。"
    echo "次のコマンドで marp-cli をグローバルにインストールしてください:"
    echo "npm install -g @marp-team/marp-cli"
    exit 1
fi

# --- ビルドプロセス ---
echo "${INPUT_FILE} のビルドプロセスを開始します..."

# 出力ディレクトリが存在しない場合は作成
mkdir -p "${OUTPUT_DIR}"

# --- CSS設定 ---
STYLESHEET_ARGS=("--stylesheet" "${BASE_CSS_FILE}")
if [ -f "${PROJECT_CSS_FILE}" ]; then
  STYLESHEET_ARGS+=("--stylesheet" "${PROJECT_CSS_FILE}")
fi

# --- PDF生成 ---
echo "PDFを生成中: ${OUTPUT_DIR}/${OUTPUT_NAME}.pdf"
marp "${INPUT_FILE}" \
    --allow-local-files \
    --html \
    --theme "${THEME}" \
    "${STYLESHEET_ARGS[@]}" \
    --pdf -o "${OUTPUT_DIR}/${OUTPUT_NAME}.pdf"

# --- HTML生成 ---
echo "HTMLを生成中: ${OUTPUT_DIR}/${OUTPUT_NAME}.html"
marp "${INPUT_FILE}" \
    --allow-local-files \
    --html \
    --theme "${THEME}" \
    "${STYLESHEET_ARGS[@]}" \
    -o "${OUTPUT_DIR}/${OUTPUT_NAME}.html"

echo ""
echo "ビルドが完了しました。ファイルは '${OUTPUT_DIR}' ディレクトリにあります。"
