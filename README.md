# Marp AI Starter

AIを活用してMarpプレゼンテーションを効率的に生成するためのテンプレートです。

## 概要

このプロジェクトは、Gemini CLI / Claude Code などの AI CLI と Marp CLI を組み合わせ、簡単なコマンドでプレゼンテーションの骨子作成からPDF/HTMLへの変換までを自動化する環境を提供します。

## ディレクトリ構成

```
marp-ai-starter/
├── .gemini/
│   └── commands/
│       └── slide.md       # スライド生成用の詳細プロンプト
├── GEMINI.md              # プロジェクト前提・AIが守るべきルール
├── themes/
│   ├── base.css           # 共通ベースデザイン（基本は触らない）
│   └── project.css        # プロジェクト上書き（ここを編集する）
├── templates/
│   └── base-slide.md      # 14枚LTのベース構成（型）
├── scripts/
│   └── build.sh           # md生成からPDF書き出しまでを自動化するスクリプト
├── CREATESLIDE.md          # スライド生成〜出力までの運用フロー
├── .env.example           # （任意）プロジェクト固有の環境変数の例
└── README.md              # このファイル
```

## 使い方

### 1. 環境設定

**AI CLI の準備（前提）**:

- 本テンプレートは、特定ベンダーの API キーをリポジトリで管理しません。
- Gemini CLI / Claude Code などの AI CLI 側で、ログイン・認証・APIキー設定等が完了している前提で利用してください。

（必要な場合のみ）プロジェクト固有の環境変数を使いたい場合は、`.env.example` をコピーして `.env` を作成し、各自で値を設定してください。
```bash
cp .env.example .env
```

- **依存ツールのインストール**:
  Marp CLIをグローバルにインストールします。
  ```bash
  npm install -g @marp-team/marp-cli
  ```

### 2. スライドの生成

Gemini CLI のカスタムコマンド `/slide` を使って、スライドのMarkdownを生成します。

```bash
/slide "あなたのプレゼンテーションのトピック"
```

これにより、AIが `slide.md` に定義されたプロンプトと `GEMINI.md` のルールに従い、`slide-deck.md` というファイル名でスライドを生成します。

> スライドのベース構成（14枚LTの型）は `templates/base-slide.md` で管理します。

> 仕様変更: `/slide` は LT（ライトニングトーク）向けの 14〜15枚構成をデフォルトとします。

### 3. ビルド

`scripts/build.sh` を実行して、生成されたMarkdownファイルをPDFとHTMLに変換します。

```bash
bash scripts/build.sh slide-deck.md
```

成功すると、`dist/` ディレクトリに `slide-deck.pdf` と `slide-deck.html` が生成されます。

> Note: `dist/` は生成物ディレクトリのため、`.gitignore` で除外しています。

## カスタマイズ

- **デザインの変更**:
  - 共通のベースは `themes/base.css`
  - プロジェクトごとの上書きは `themes/project.css`（任意）
  - `scripts/build.sh` は `base.css` を必ず読み込み、`project.css` が存在すれば追加で読み込みます。
- **AIへの指示変更**: `.gemini/commands/slide.md` や `GEMINI.md` の内容を調整することで、AIの振る舞いや生成されるスライドの構成をカスタマイズできます。

## スライド生成フロー（運用）

実際の運用手順（生成→修正→PDF/HTML/PPTX出力）は `CREATESLIDE.md` を参照してください。