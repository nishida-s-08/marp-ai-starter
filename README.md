# Marp AI Starter

AIを活用して、高品質なMarpプレゼンテーションを効率的に生成・管理するためのテンプレートです。

## 概要

AIによる構成案の作成 → ドラフト生成 → ユーザーによる編集 → 自動ビルドという、スピードと品質を両立したワークフローを提供します。

---

## 事前準備

### 1. Marp CLI のインストール
スライドをPDFやHTMLに変換するために必要です。
```bash
npm install -g @marp-team/marp-cli
```

### 2. 環境設定（画像自動取得用）
Unsplashから画像を自動取得する場合は、`.env`ファイルにAPIキーを設定してください。
```bash
cp .env.example .env
# .env を開き UNSPLASH_ACCESS_KEY を設定
```

---

## スライド生成ワークフロー

### 1. AI による構成案とドラフトの生成
`documents/` に参考資料（PDFやテキスト）を配置しておくと、AIが内容を読み取ってスライドに反映します。

その後、チャットでトピックを指定してコマンドを実行します。
```bash
/slide "生成AIが変えるソフトウェア開発の未来"
```
AIが構成案（目次）を提示します。内容に合意すると、**`slides/`** ディレクトリに Markdown ファイルが書き出されます。

### 2. ユーザーによる修正（★重要）
生成された `slides/filename.md` をエディタで開き、内容をレビュー・修正します。
- グラフやKPIカードの挿入: `templates/SNIPPETS.md` からコピー＆ペースト
- 画像の指定: `<!-- fetch-image: "keyword" -->` を追記

### 3. 自動ビルド
修正が完了したら、ビルドスクリプトを実行して成果物（PDF/HTML）を出力します。
```bash
# 画像を自動取得してビルド（dist/ に出力）
bash scripts/build.sh slides/filename.md --fetch
```

---

## プロジェクト構成

```
marp-ai-starter/
├── .gemini/commands/   # AI用カスタムコマンド定義（/slide 等）
├── documents/          # [Git除外] スライド生成用の参考資料（PDF・テキスト）
├── slides/             # [Git除外] スライド作業場。AIがここに出力
├── themes/             # スタイルシート（ビルド時に自動統合）
│   ├── base.css        # 基本デザイン（編集禁止）
│   ├── charts.css      # コンポーネント用（編集禁止）
│   └── project.css     # ★個別カスタマイズ（色やフォントを変更）
├── templates/          # 素材集（スニペットや基本の型）
├── scripts/            # 実行ツール（ビルド、画像取得）
├── dist/               # [Git除外] 生成された PDF / HTML の出力先
├── GEMINI.md           # AIへの指示書（コンポーネント仕様など）
└── README.md           # このファイル
```

---

## カスタマイズ（project.css）

スライド全体の配色やフォントを変えたい場合は、**`themes/project.css`** を編集してください。
プリセット（Green, Orange, Purple等）がコメントアウト形式で用意されています。
