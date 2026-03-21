#!/bin/bash

# build.sh
#
# MarpのMarkdownファイルをPDFおよびHTML形式に変換するスクリプト
#
# ─── 使い方 ──────────────────────────────────────────────────────────────────
#
#   # 通常ビルド
#   bash scripts/build.sh slide-deck.md
#
#   # 画像取得 → ビルドを一括実行
#   bash scripts/build.sh slide-deck.md --fetch
#
# ─── --fetch モードの書き方 ───────────────────────────────────────────────────
#
#   Markdown に以下のコメントを書くと、ビルド前に自動ダウンロードします:
#
#   <!-- fetch-image: "technology abstract" -->
#   <!-- fetch-image: "business team" 2 -->
#   <!-- fetch-image: "night city" 1 hero -->
#   <!-- fetch-image: "forest" 2 forest landscape -->
#
#   保存先: assets/images/<basename>.jpg
#   スライド内参照: ![bg](assets/images/hero.jpg)
#
# ─── 依存関係 ─────────────────────────────────────────────────────────────────
#
#   - marp-cli:  npm install -g @marp-team/marp-cli
#   - (--fetch): curl, jq, UNSPLASH_ACCESS_KEY (.env または 環境変数)
#
# ─────────────────────────────────────────────────────────────────────────────

set -euo pipefail

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'
log_info()    { echo -e "${CYAN}[INFO]${NC}  $*"; }
log_success() { echo -e "${GREEN}[OK]${NC}    $*"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $*" >&2; }

# ── 引数パース ───────────────────────────────────────────────────────────────
INPUT_FILE="${1:-}"
DO_FETCH=false
for arg in "$@"; do [ "${arg}" = "--fetch" ] && DO_FETCH=true; done

if [ -z "${INPUT_FILE}" ] || [ "${INPUT_FILE}" = "--fetch" ]; then
  echo "使い方: $0 <markdown_file> [--fetch]"
  exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_ROOT=$(cd "${SCRIPT_DIR}/.." && pwd)
OUTPUT_NAME=$(basename "${INPUT_FILE}" .md)
OUTPUT_DIR="${REPO_ROOT}/dist"
BASE_CSS_FILE="${REPO_ROOT}/themes/base.css"
CHARTS_CSS_FILE="${REPO_ROOT}/themes/charts.css"
PROJECT_CSS_FILE="${REPO_ROOT}/themes/project.css"
FETCH_SCRIPT="${REPO_ROOT}/scripts/fetch-image.sh"
# PDF出力時にChart.jsの描画完了を待つミリ秒数
PDF_WAIT_MS=800

if [ ! -f "${INPUT_FILE}" ]; then
  log_error "ファイル '${INPUT_FILE}' が見つかりません。"; exit 1
fi
if ! command -v marp &>/dev/null; then
  log_error "'marp' コマンドが見つかりません。"
  echo "  npm install -g @marp-team/marp-cli"; exit 1
fi

# ═══════════════════════════════════════════════════════════════════════════════
# --fetch: Markdown内のコメントから画像を自動取得
# ═══════════════════════════════════════════════════════════════════════════════
if [ "${DO_FETCH}" = true ]; then
  if [ ! -f "${FETCH_SCRIPT}" ]; then
    log_error "fetch-image.sh が見つかりません: ${FETCH_SCRIPT}"; exit 1
  fi

  log_info "fetch-image ディレクティブを検索中..."
  FETCH_DIRECTIVES=$(grep -oE '<!-- fetch-image: [^>]+ -->' "${INPUT_FILE}" || true)

  if [ -z "${FETCH_DIRECTIVES}" ]; then
    log_info "fetch-image コメントなし。スキップします。"
  else
    FETCH_COUNT=$(echo "${FETCH_DIRECTIVES}" | wc -l | tr -d ' ')
    log_info "${FETCH_COUNT} 件検出。画像を取得します..."
    echo ""
    while IFS= read -r directive; do
      INNER=$(echo "${directive}" | sed 's/<!-- fetch-image: //;s/ -->//')
      KEYWORD=$(echo "${INNER}" | grep -oE '"[^"]+"' | head -1 | tr -d '"')
      REST=$(echo "${INNER}" | sed 's/"[^"]*"//' | tr -s ' ')
      ARG2=$(echo "${REST}" | awk '{print $1}')
      ARG3=$(echo "${REST}" | awk '{print $2}')
      ARG4=$(echo "${REST}" | awk '{print $3}')
      [ -z "${KEYWORD}" ] && continue
      bash "${FETCH_SCRIPT}" "${KEYWORD}" "${ARG2:-1}" "${ARG3:-}" "${ARG4:-landscape}"
    done <<< "${FETCH_DIRECTIVES}"
  fi
  echo ""
fi

# ═══════════════════════════════════════════════════════════════════════════════
# ビルド
# ═══════════════════════════════════════════════════════════════════════════════
log_info "${INPUT_FILE} のビルドを開始します..."
mkdir -p "${OUTPUT_DIR}"

# base.css は /* @theme ark-base */ 宣言を持つカスタムテーマのため --theme で直接指定する。
# charts.css / project.css は base.css に追加注入するスタイルとして --stylesheet で渡す。
STYLESHEET_ARGS=()
if [ -f "${CHARTS_CSS_FILE}" ]; then
  STYLESHEET_ARGS+=("--stylesheet" "${CHARTS_CSS_FILE}")
fi
if [ -f "${PROJECT_CSS_FILE}" ]; then
  STYLESHEET_ARGS+=("--stylesheet" "${PROJECT_CSS_FILE}")
fi

log_info "PDF を生成中: ${OUTPUT_DIR}/${OUTPUT_NAME}.pdf"
marp "${INPUT_FILE}" \
  --allow-local-files --html \
  --theme "${BASE_CSS_FILE}" \
  "${STYLESHEET_ARGS[@]}" \
  --pdf --wait "${PDF_WAIT_MS}" \
  -o "${OUTPUT_DIR}/${OUTPUT_NAME}.pdf"

log_info "HTML を生成中: ${OUTPUT_DIR}/${OUTPUT_NAME}.html"
marp "${INPUT_FILE}" \
  --allow-local-files --html \
  --theme "${BASE_CSS_FILE}" \
  "${STYLESHEET_ARGS[@]}" \
  -o "${OUTPUT_DIR}/${OUTPUT_NAME}.html"

echo ""
log_success "ビルド完了 → ${OUTPUT_DIR}/"