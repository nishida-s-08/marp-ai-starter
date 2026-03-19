# Marp AI Starter

AIを活用して、高品質なMarpプレゼンテーションを効率的に生成・管理するためのテンプレートです。

## 概要

AIによるドラフト作成 → ユーザーによる編集 → 自動ビルドという安定したワークフローを提供します。

---

## プロジェクト構成（ディレクトリと主要ファイル）

安定運用のために役割を明確に定義しています。

```
marp-ai-starter/
├── .gemini/commands/   # AI用カスタムコマンド定義
├── slides/             # [Git除外] スライドMarkdownの作業場。AIがここに出力します
├── themes/             # スタイルシート（ビルド時に自動統合されます）
│   ├── base.css        # 基本デザイン。レイアウトの土台（編集禁止）
│   ├── charts.css      # コンポーネント用。グラフやカードの装飾（編集禁止）
│   └── project.css     # ★個別カスタマイズ。色やフォントはここで変更します
├── templates/          # 素材集。スニペットや基本の型
├── scripts/            # 実行ツール
│   ├── build.sh        # MarkdownをPDF/HTMLに変換するメインスクリプト
│   └── fetch-image.sh  # Unsplashから画像を自動取得するスクリプト
├── assets/images/      # [Git除外] ダウンロードされた画像アセット
├── dist/               # [Git除外] 生成された PDF / HTML の最終出力先
├── GEMINI.md           # AIへの指示書。コンポーネント仕様の詳細
└── README.md           # このファイル
```

---

## スライド生成ワークフロー

### 1. AI によるドラフト生成
`/slide` コマンドを使用して構成を固めると、AIが **`slides/`** ディレクトリに Markdown を書き出します。

### 2. ユーザーによる修正（★重要）
生成された `slides/filename.md` をエディタで開き、内容をレビュー・修正します。

### 3. 自動ビルド
修正が完了したら、スクリプトを実行して成果物を出力します。
```bash
# 画像を自動取得して PDF/HTML を生成（dist/ に出力）
bash scripts/build.sh slides/filename.md --fetch
```

---

## カスタマイズ（project.css）

スライド全体の雰囲気（色・フォント）を変えたい場合は、**`themes/project.css`** の `:root` 変数を書き換えてください。
プリセット（Ark Graphics, Green, Orange等）がコメントアウト形式で用意されています。
