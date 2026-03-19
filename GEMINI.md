# GEMINIコンテキスト: Marp AI Starter（プロジェクト前提・ルール）

このファイルは、AI（Gemini CLI / Claude Code など）がこのリポジトリで作業する際に守るべき **前提** と **運用ルール** をまとめたものです。

> スライドの「ベース構成（14枚LTの型）」は `templates/base-slide.md` で管理します。

---

## 1. このリポジトリの前提

### 認証・APIキー
- このテンプレートは、特定ベンダーの API キーをリポジトリ内で管理しません。
- Gemini CLI / Claude Code 側で、ログイン・認証・APIキー設定等が完了している前提で利用します。

### 成果物の扱い
- `dist/` や `slide/` の生成物は **git管理しない**（`.gitignore` で除外）
- 作業用の一時生成物も同様にgit管理しない

---

## 2. スライド生成の基本ルール（共通）

### スライドの型（base slide）
- **14枚LTの標準構成**は `templates/base-slide.md` を参照し、並び・章立てを基本的に崩さない
- 迷ったら `templates/base-slide.md` をコピーして埋める運用を優先

### Marp Markdown の最低要件
- Marp CLIで解釈可能な形式で出力する
- スライド区切りは `<!-- スライド区切り -->` を使う
- 先頭に `marp: true` を含むフロントマターを置く

---

## 3. デザインルール（sample_slide.pdf 準拠）

`themes/base.css` が **sample_slide.pdf のデザインを忠実に再現** したベーススタイルです。
`themes/project.css` でプロジェクトごとにカスタマイズします。

### カラートークン（:root 変数）

| 変数名 | デフォルト値 | 用途 |
|---|---|---|
| `--color-primary` | `#1e2d6e` | 見出し・ボーダーアクセント・強調 |
| `--color-accent` | `#2ab4b4` | サブタイトル・Afterカード・アクセント |
| `--color-background` | `#f4f6fb` | スライド背景 |
| `--color-foreground` | `#2c2c2c` | 本文テキスト |
| `--color-surface` | `#ffffff` | カード背景 |
| `--color-border` | `#d6dce8` | ボーダー |
| `--color-muted` | `#8892a4` | 補足・英語サブタイトル |
| `--color-issue` | `#e05a5a` | ISSUEラベル |
| `--color-vision` | `#5a7de0` | VISIONラベル |
| `--color-topic` | `#2ab4b4` | TOPICラベル |
| `--color-tips` | `#3fba89` | TIPSラベル |
| `--deco-dot-1〜4` | グレー→ネイビー | 右上ドットデコレーション |

### フォント変数

| 変数名 | デフォルト |
|---|---|
| `--font-family-main` | Montserrat, Noto Sans JP, ... |
| `--font-family-heading` | Montserrat, Noto Sans JP, ... |
| `--font-family-en` | Montserrat, Avenir Next, ... |

---

## 4. コンポーネント一覧

AIはスライドを生成する際、以下のコンポーネントを優先して使うこと。

### ① ページヘッダーバー
```html
<header><span>日本語タイトル</span><span class="header-en">English Subtitle</span></header>
```
→ 各スライドの先頭に配置。左: 日本語、右: 英語サブタイトル（大文字）。

### ② スライド番号（大きい薄いナンバリング）
```html
<div class="slide-no">01</div>
```
→ 左上に薄く大きく表示される装飾番号。

### ③ 英語サブタイトル（インライン）
```html
<div class="subtitle-en">Overview</div>
```
→ 見出し直下に小さく英語で補足する場合に使用。

### ④ ラベルバッジ
```html
<span class="label issue">ISSUE</span>
<span class="label vision">VISION</span>
<span class="label topic">TOPIC</span>
<span class="label tips">TIPS</span>
```

### ⑤ ISSUEブロック（課題の番号付きボックス）
```html
<div class="issue-block">
  <div class="issue-no">ISSUE<span>01</span></div>
  <div>
    <div class="issue-title">課題タイトル</div>
    <ul><li>内容</li></ul>
  </div>
</div>
```

### ⑥ Before/Action/Tips/After ステップリスト
```html
<div class="step-list">
  <div class="step-item before">
    <div class="step-label">Before</div>
    <div class="step-content">
      <div class="step-title">取り組みの背景</div>
      <ul><li>内容</li></ul>
    </div>
  </div>
  <div class="step-item action">...</div>
  <div class="step-item tips">...</div>
  <div class="step-item after">...</div>
</div>
```

### ⑦ トピックカード（3列）
```html
<div class="topic-cards">
  <div class="topic-card">
    <div class="tc-label">TOPIC 01</div>
    <div class="tc-title">タイトル</div>
    <div class="tc-tag">タグ1／タグ2</div>
    <p>説明文</p>
  </div>
</div>
```

### ⑧ VISIONブロック（楕円ボタン風）
```html
<div class="vision-label">VISION 01　ビジョン名</div>
<div class="vision-block">一言で表すビジョン</div>
<div class="vision-note">補足説明</div>
```

### ⑨ 3列カード（Before/Action/After）
```html
<div class="cards">
  <div class="card before">
    <div class="card-title">Before</div>
    <ul><li>内容</li></ul>
  </div>
  <div class="card action">...</div>
  <div class="card after">...</div>
</div>
```

### ⑩ 2カラムレイアウト
```html
<div class="cols">
  <div>左カラム</div>
  <div>右カラム</div>
</div>
```

### ⑪ 番号付き強調リスト
```html
<ol class="highlight-list">
  <li><strong>項目名</strong> ── 説明</li>
</ol>
```

### ⑫ タイトルスライド専用クラス
```md
<!-- _class: title-slide -->
# タイトル
<div class="title-subtitle">サブタイトル</div>
部署名
<div class="title-meta">作成者：名前　作成日：日付</div>
```

### ⑬ セクション区切りスライド専用クラス
```md
<!-- _class: section-slide -->
<div class="sec-no">01</div>
---
## セクション名
```

### ⑭ 書き方ガイド（編集時メモ、出力後は削除）
```html
<div class="guide">（書き方例）ここに編集メモを書く</div>
```

---

## 5. カスタマイズ方法（project.css）

`themes/project.css` の `:root { }` 内に変数を上書きするだけ。

### プリセットカラーセット

| テーマ | primary | accent | background |
|---|---|---|---|
| **ARK GRAPHICS（デフォルト）** | `#1e2d6e` | `#2ab4b4` | `#f4f6fb` |
| モノクロ/コーポレートグレー | `#1a1a1a` | `#5a5a5a` | `#f7f7f7` |
| グリーン（環境・サステナ） | `#1b4d35` | `#2d9e6b` | `#f4f9f5` |
| ウォームオレンジ | `#c0440a` | `#e87d3e` | `#fffaf5` |
| パープル（テック・AI） | `#3a1a6e` | `#7c3aed` | `#f8f5ff` |

### 例: グリーンテーマに切り替える場合
```css
:root {
  --color-primary:    #1b4d35;
  --color-accent:     #2d9e6b;
  --color-background: #f4f9f5;
  --deco-dot-1: #a8c9b4;
  --deco-dot-2: #5baa80;
  --deco-dot-3: #2d7a50;
  --deco-dot-4: #1b4d35;
}
```

---

## 6. コマンド運用

- カスタムコマンド定義は `.gemini/commands/` に置く
- 例: `/slide "トピック"`（詳細は `.gemini/commands/slide.md`）