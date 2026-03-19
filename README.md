# Marp AI Starter

AIを活用してMarpプレゼンテーションを効率的に生成するためのテンプレートです。

## 概要

このプロジェクトは、Gemini CLI / Claude Code などの AI CLI と Marp CLI を組み合わせ、
簡単なコマンドでプレゼンテーションの骨子作成から PDF / HTML への変換までを自動化する環境を提供します。

---

## ディレクトリ構成

```
marp-ai-starter/
├── .gemini/
│   └── commands/
│       └── slide.md            # /slide コマンドの詳細プロンプト
│
├── themes/                     # スタイルシート（build.sh が自動読み込み）
│   ├── base.css                # ベースデザイン（sample_slide.pdf 準拠・触らない）
│   ├── charts.css              # グラフ・KPIカード・表・画像レイアウト（触らない）
│   └── project.css             # ★プロジェクトごとの配色・フォント上書き（ここだけ編集）
│
├── templates/                  # コピペ用素材
│   ├── base-slide.md           # 14〜15枚LTの型テンプレート
│   └── SNIPPETS.md             # グラフ・KPI・表・画像スニペット集
│
├── scripts/
│   ├── build.sh                # Markdown → PDF / HTML 変換スクリプト
│   └── fetch-image.sh          # Unsplash API で画像を自動取得するスクリプト
│
├── assets/
│   └── images/                 # fetch-image.sh の保存先（git管理しない）
│       └── CREDITS.md          # 取得画像のクレジット自動記録
│
├── dist/                       # ビルド成果物（git管理しない）
│
├── GEMINI.md                   # AIへの指示・コンポーネント一覧・カスタマイズ方法
├── CREATESLIDE.md              # スライド生成〜出力までの運用フロー
├── .env.example                # APIキーのテンプレート（.env にコピーして使う）
└── README.md                   # このファイル
```

---

## セットアップ

### 1. Marp CLI のインストール

```bash
npm install -g @marp-team/marp-cli
```

### 2. AI CLI の準備

本テンプレートは特定ベンダーの API キーをリポジトリで管理しません。
Gemini CLI / Claude Code 側でログイン・認証が完了している前提で利用してください。

### 3. Unsplash API キーの設定（画像自動取得を使う場合のみ）

```bash
cp .env.example .env
# .env を開き UNSPLASH_ACCESS_KEY=your_key_here を記入
# キー取得先: https://unsplash.com/developers（無料・50リクエスト/時）
```

---

## 使い方

### スライドの生成

Gemini CLI のカスタムコマンド `/slide` を使ってスライドの Markdown を生成します。

```bash
/slide "あなたのプレゼンテーションのトピック"
```

AIが `GEMINI.md` のルールに従い、`slide-deck.md` を生成します。
または、テンプレートを直接コピーして手で埋める方式も使えます。

```bash
cp templates/base-slide.md my-talk.md
```

### グラフ・KPI・表・画像の挿入

`templates/SNIPPETS.md` にコピペ用のスニペットが揃っています。

| スニペット | 内容 |
|---|---|
| SNIPPET 01 | KPIカード（4列・数値を大きく表示） |
| SNIPPET 02 | データテーブル（達成率バッジ付き） |
| SNIPPET 03 | 棒グラフ（Chart.js） |
| SNIPPET 04 | 折れ線グラフ＋ドーナツグラフ（2列） |
| SNIPPET 05 | レーダーチャート＋折れ線グラフ（2列） |
| SNIPPET 06 | 画像＋テキスト（2カラム） |
| SNIPPET 07 | 背景画像スライド |
| SNIPPET 08 | 円グラフ＋KPIカード組み合わせ |

### 画像の自動取得

```bash
# キーワードで1枚取得
bash scripts/fetch-image.sh "technology"

# 枚数・ファイル名・向きを指定
bash scripts/fetch-image.sh "night city" 1 hero landscape
```

保存先: `assets/images/<basename>.jpg`
スライド内での参照:

```markdown
![bg left:40%](assets/images/hero.jpg)
```

### ビルド

```bash
# 通常ビルド（PDF + HTML を dist/ に出力）
bash scripts/build.sh slide-deck.md

# 画像自動取得 → ビルドを一括実行
bash scripts/build.sh slide-deck.md --fetch
```

`dist/` に `slide-deck.pdf` と `slide-deck.html` が生成されます。

---

## カスタマイズ

配色・フォントの変更は `themes/project.css` **のみ** 編集します。
`themes/base.css` と `themes/charts.css` は触りません。

```css
/* themes/project.css の例: グリーンテーマ */
:root {
  --color-primary:    #1b4d35;
  --color-accent:     #2d9e6b;
  --color-background: #f4f9f5;
}
```

**プリセットカラーセット一覧（`project.css` にコメントで収録）:**

| テーマ | `--color-primary` | `--color-accent` |
|---|---|---|
| ARK GRAPHICS（デフォルト） | `#1e2d6e` | `#2ab4b4` |
| モノクロ / コーポレートグレー | `#1a1a1a` | `#5a5a5a` |
| グリーン（環境・サステナ） | `#1b4d35` | `#2d9e6b` |
| ウォームオレンジ | `#c0440a` | `#e87d3e` |
| パープル（テック・AI） | `#3a1a6e` | `#7c3aed` |

---

## 詳細ドキュメント

| ファイル | 内容 |
|---|---|
| `CREATESLIDE.md` | スライド生成〜出力までのステップごとの運用手順 |
| `GEMINI.md` | AIへの指示・全コンポーネントのHTML記法・変数一覧 |
| `templates/SNIPPETS.md` | グラフ・KPI・表・画像のコピペ用スニペット集 |