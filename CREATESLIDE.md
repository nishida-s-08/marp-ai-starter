# スライド生成フロー（このリポジトリで実行可能な範囲）

## 1. 概要

このドキュメントは、AI（Gemini CLI / Claude Code など）で Marp 形式のスライドMarkdownを作成し、
`marp` コマンドで PDF / HTML / PPTX を出力するまでのワークフローを定義します。

---

## 2. 参照ファイル一覧

| ファイル | 用途 | 編集可否 |
|---|---|---|
| `GEMINI.md` | AIへの指示・全コンポーネント記法・変数一覧 | 読み取り専用 |
| `themes/base.css` | sample_slide.pdf 準拠のベースデザイン | **触らない** |
| `themes/charts.css` | グラフ・KPIカード・表・画像レイアウト | **触らない** |
| `themes/project.css` | プロジェクトごとの配色・フォント上書き | **ここだけ編集** |
| `templates/base-slide.md` | 14〜15枚LTの型テンプレート | コピーして使う |
| `templates/SNIPPETS.md` | グラフ・KPI・表・画像のスニペット集 | コピーして使う |
| `scripts/build.sh` | Markdown → PDF / HTML 変換 | 基本触らない |
| `scripts/fetch-image.sh` | Unsplash API で画像を自動取得 | 基本触らない |
| `.env` | APIキー管理（.env.example からコピー） | 各自設定 |

---

## 3. 事前準備

### Marp CLI のインストール

```bash
npm install -g @marp-team/marp-cli
```

### Unsplash API キーの設定（画像自動取得を使う場合のみ）

```bash
cp .env.example .env
# .env を開き UNSPLASH_ACCESS_KEY=your_key_here を記入
# キー取得先: https://unsplash.com/developers（無料・50リクエスト/時）
```

---

## 4. 実行フロー

### ステップ1: プロジェクトのカスタマイズ（任意）

`themes/project.css` の `:root` 内のコメントを外すだけで配色が切り替わります。

| テーマ | primary | accent |
|---|---|---|
| ARK GRAPHICS（デフォルト） | `#1e2d6e` | `#2ab4b4` |
| モノクロ / コーポレートグレー | `#1a1a1a` | `#5a5a5a` |
| グリーン（環境・サステナ） | `#1b4d35` | `#2d9e6b` |
| ウォームオレンジ | `#c0440a` | `#e87d3e` |
| パープル（テック・AI） | `#3a1a6e` | `#7c3aed` |

完全なプリセット定義は `themes/project.css` のコメントを参照してください。

### ステップ2: トピックを決める

```bash
/slide "開発組織におけるAI活用のはじめ方"
```

または直接テンプレートをコピー:

```bash
cp templates/base-slide.md my-talk.md
```

> `/slide` はまず「14〜15枚の構成案（番号付き）」だけを提示し、承認後に本文生成へ進みます。

### ステップ3: グラフ・KPI・表・画像を組み込む

`templates/SNIPPETS.md` からコピペします。

| 入れたい要素 | 参照スニペット |
|---|---|
| 数値KPIカード | SNIPPET 01 |
| 目標vs実績の表 | SNIPPET 02 |
| 棒グラフ | SNIPPET 03 |
| 折れ線＋ドーナツグラフ（2列） | SNIPPET 04 |
| レーダー＋折れ線グラフ（2列） | SNIPPET 05 |
| テキスト＋画像（2カラム） | SNIPPET 06 |
| 背景画像スライド | SNIPPET 07 |
| 円グラフ＋KPIカード | SNIPPET 08 |

### ステップ4: 画像ディレクティブを書く（オプション）

Markdown に以下のコメントを書くと、`--fetch` ビルド時に自動取得できます。

```markdown
<!-- fetch-image: "technology abstract" -->
<!-- fetch-image: "business meeting" 2 -->
<!-- fetch-image: "night city skyline" 1 hero -->
<!-- fetch-image: "green forest" 1 forest landscape -->
```

| 引数 | 意味 | 省略時 |
|---|---|---|
| `"keyword"` | 検索キーワード（英語推奨） | 必須 |
| `count` | 取得枚数（1〜10） | `1` |
| `basename` | 保存ファイル名（拡張子なし） | キーワードから自動生成 |
| `orientation` | `landscape` / `portrait` / `squarish` | `landscape` |

保存先は `assets/images/<basename>.jpg`。スライド内での参照:

```markdown
![bg left:40%](assets/images/hero.jpg)
![bg right opacity:.4](assets/images/hero.jpg)
```

画像取得のみを単独実行する場合:

```bash
bash scripts/fetch-image.sh "technology"
bash scripts/fetch-image.sh "night city" 1 hero landscape
```

### ステップ5: ビルド

```bash
# 通常ビルド（PDF + HTML を dist/ に出力）
bash scripts/build.sh slide-deck.md

# 画像自動取得 → ビルドを一括実行
bash scripts/build.sh slide-deck.md --fetch
```

#### PPTX（PowerPoint）出力

```bash
mkdir -p slide
marp slide-deck.md --pptx --allow-local-files --theme default \
  --stylesheet themes/base.css \
  --stylesheet themes/charts.css \
  --stylesheet themes/project.css \
  -o slide/slide-deck.pptx
```

> Note: marp の PPTX は表現に制約があります。Chart.js グラフや複雑なレイアウトは
> PDF の方が再現性が高いです。

---

## 5. よくある質問

**Q. 配色だけ変えたい**
→ `themes/project.css` の `:root` に変数を上書きするだけです。`base.css` は触りません。

**Q. グラフの色が project.css のテーマ色に追従しない**
→ Chart.js の `backgroundColor` に CSS 変数を使っているか確認してください。
  `getComputedStyle(document.documentElement).getPropertyValue('--color-primary')` で取得するのが正しい書き方です（SNIPPETS.md のサンプル参照）。

**Q. PDF でグラフが空白になる**
→ `build.sh` の `PDF_WAIT_MS` の値（デフォルト: 800ms）を増やしてください。

**Q. Unsplash に合う英語キーワードが思いつかない**
→ AI に「このスライドに合う Unsplash 検索キーワードを英語で3つ提案して」と聞くのが早いです。

**Q. 毎回違う画像になってしまう**
→ `/photos/random` を使っているため意図的な仕様です。気に入ったファイルは上書きしないよう管理してください。

**Q. 画像のクレジット表記は？**
→ `assets/images/CREDITS.md` に自動記録されます。スライドのQ&Aページ等に転記することを推奨します（Unsplash ライセンスはクレジット任意ですが推奨されています）。