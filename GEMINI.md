# GEMINIコンテキスト: Marp AI Starter（プロジェクト前提・ルール）

このファイルは、AI（Gemini CLI / Claude Code など）がこのリポジトリで作業する際に守るべき **前提** と **運用ルール** をまとめたものです。

> スライドの「ベース構成（14〜15枚LTの型）」は `templates/base-slide.md` で管理します。
> グラフ・KPI・表・画像のスニペットは `templates/SNIPPETS.md` を参照してください。

---

## 1. このリポジトリの前提

### 認証・APIキー
- このテンプレートは、特定ベンダーの API キーをリポジトリ内で管理しません。
- Gemini CLI / Claude Code 側で、ログイン・認証・APIキー設定等が完了している前提で利用します。

### 成果物の扱い
- `dist/` や `slide/` の生成物は **git管理しない**（`.gitignore` で除外）
- `assets/images/` の取得画像も同様にgit管理しない
- 作業用の一時生成物も同様にgit管理しない

---

## 2. スライド生成の基本ルール（共通）

### スライドの型（base slide）
- **14〜15枚LTの標準構成**は `templates/base-slide.md` を参照し、並び・章立てを基本的に崩さない
- 迷ったら `templates/base-slide.md` をコピーして埋める運用を優先

### Marp Markdown の最低要件
- Marp CLI で解釈可能な形式で出力する
- **スライド区切りは `---`（Marp 正式記法）を使う**
- 先頭フロントマターに必ず `marp: true` と `theme: default` を含める
- グラフを使うスライドがある場合はフロントマター直下に Chart.js CDN を記載する

```markdown
---
marp: true
theme: default
paginate: true
---

<!-- Chart.js CDN（グラフを使う場合のみ） -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4/dist/chart.umd.min.js"></script>
```

### テーマについて
- **`theme: default` を必ず使う**
- `theme: gaia` / `theme: uncover` 等は独自スタイルが強く、`base.css` のカスタマイズが効かなくなるため使用禁止

---

## 3. デザインルール（sample_slide.pdf 準拠）

CSS の読み込み順: `base.css` → `charts.css` → `project.css`（build.sh が自動処理）

- `themes/base.css` — sample_slide.pdf のデザインを忠実に再現したベーススタイル（**触らない**）
- `themes/charts.css` — グラフ・KPIカード・表・画像レイアウト用スタイル（**触らない**）
- `themes/project.css` — プロジェクトごとの配色・フォント上書き（**ここだけ編集**）

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
グラフ・KPI・表・画像の詳細スニペットは `templates/SNIPPETS.md` を参照。

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
<!-- .cols       : テキスト多め（左57% / 右43%）← デフォルト -->
<!-- .cols-half  : 均等2列（50% / 50%）-->
<!-- .cols-right : 画像メイン（左40% / 右60%）-->
<!-- .cols-wide  : 本文広め（左65% / 右35%）-->
<div class="cols">
  <div>左カラム（テキスト・リスト・表）</div>
  <div>右カラム（画像・グラフ）</div>
</div>
```
→ 画像を右に大きく見せたい場合は `cols-right`、左右均等なら `cols-half` を使う

### ⑪ 番号付き強調リスト
```html
<ol class="highlight-list">
  <li><strong>項目名</strong> ── 説明</li>
</ol>
```

### ⑫ KPIカード（charts.css）
```html
<div class="kpi-cards">
  <div class="kpi-card">
    <div class="kpi-label">指標名</div>
    <div class="kpi-value">13<span class="kpi-unit">件</span></div>
    <div class="kpi-delta up">目標比 130%</div>
  </div>
</div>
```
→ `kpi-card` の修飾クラス: `accent` / `positive` / `negative`
→ 詳細・バリエーションは `templates/SNIPPETS.md` SNIPPET 01 参照

### ⑬ データテーブル（charts.css）
```html
<table class="data-table">
  <thead><tr><th>項目</th><th class="num">目標</th><th class="num">実績</th></tr></thead>
  <tbody>
    <tr><td>内容</td><td class="num">10</td><td class="num"><span class="badge over">130%</span></td></tr>
  </tbody>
</table>
```
→ `badge` クラス: `over`（超過・緑）/ `meet`（達成・青）/ `under`（未達・赤）
→ 詳細は `templates/SNIPPETS.md` SNIPPET 02 参照

### ⑭ グラフ（Chart.js / charts.css）
```html
<div class="chart-wrap" style="height:280px">
  <canvas id="myChart"></canvas>
</div>
<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const primary = getComputedStyle(document.documentElement).getPropertyValue('--color-primary').trim() || '#1e2d6e';
    const accent  = getComputedStyle(document.documentElement).getPropertyValue('--color-accent').trim()  || '#2ab4b4';
    new Chart(document.getElementById('myChart'), {
      type: 'bar', // bar / line / doughnut / pie / radar
      data: { labels: [...], datasets: [{ data: [...], backgroundColor: primary }] },
      options: { responsive: true, maintainAspectRatio: false }
    });
  }
  init();
})();
</script>
```
→ 棒・折れ線・ドーナツ・円・レーダーの完全サンプルは `templates/SNIPPETS.md` SNIPPET 03〜05・08 参照
→ **Chart.js の色は必ず CSS 変数から取得**し、ハードコードしない（project.css の色変更に追従させるため）

### ⑮ 画像配置（fetch-image.sh 連携）
```html
<!-- 2カラム内に配置する場合 -->
<div class="cols">
  <div>テキスト・リスト</div>
  <div>
    <!-- fetch-image: "business meeting" 1 hero -->
    <!-- 取得後: -->
    ![説明](assets/images/hero.jpg)
  </div>
</div>

<!-- 背景画像 -->
<!-- _backgroundImage: url(assets/images/hero.jpg) -->
<!-- _backgroundOpacity: 0.15 -->
```
→ `fetch-image:` ディレクティブを書いておくと `build.sh --fetch` で自動取得
→ 画像未準備時はプレースホルダーで代替: `<div class="img-placeholder">📷 説明</div>`
→ 詳細は `templates/SNIPPETS.md` SNIPPET 06・07 参照

### ⑯ 2グラフ横並びレイアウト（charts.css）
```html
<div class="two-charts">
  <div class="chart-col">
    <div class="chart-title">左グラフタイトル</div>
    <div class="callout">注釈テキスト</div>
    <div class="chart-wrap" style="height:220px"><canvas id="chart1"></canvas></div>
  </div>
  <div class="chart-col">
    <div class="chart-title">右グラフタイトル</div>
    <div class="chart-wrap" style="height:220px"><canvas id="chart2"></canvas></div>
  </div>
</div>
```

### ⑰ タイトルスライド専用クラス
```markdown
<!-- _class: title-slide -->
# タイトル
<div class="title-subtitle">サブタイトル</div>
部署名
<div class="title-meta">作成者：名前　作成日：日付</div>
```

### ⑱ セクション区切りスライド専用クラス
```markdown
<!-- _class: section-slide -->
<div class="sec-no">01</div>
<hr>
## セクション名
```

### ⑲ 書き方ガイド（編集時メモ、出力後は削除）
```html
<div class="guide">（書き方例）ここに編集メモを書く</div>
```

---

## 5. コンテンツとコンポーネントの対応表

| 伝えたい内容 | 使うコンポーネント |
|---|---|
| 数値KPIを大きく見せる | `kpi-cards` / `kpi-card` |
| 目標vs実績の表 | `data-table`（バッジ付き） |
| 時系列の推移 | 折れ線グラフ（SNIPPET 04・05） |
| 比率・構成比 | ドーナツ・円グラフ（SNIPPET 04・08） |
| 複数指標の比較 | レーダーチャート（SNIPPET 05） |
| 達成率の比較 | 棒グラフ（SNIPPET 03） |
| 課題の列挙 | `issue-block` |
| 施策と効果の流れ | `step-list`（Before/Action/Tips/After） |
| 3つのトピックをカードで | `topic-cards` |
| 将来の方向性 | `vision-block` |
| テキスト＋画像（テキスト多め） | `cols` + `img` |
| テキスト＋画像（均等） | `cols-half` + `img` |
| テキスト＋画像（画像メイン） | `cols-right` + `img` |
| 画像未準備の仮置き | `cols` + `img-placeholder` |
| 背景に画像を薄く敷く | `_backgroundImage` + `_backgroundOpacity` |
| 3点比較（横並び） | `cards`（Before/Action/After） |
| 本文＋図表 | `cols` / `cols-half` |
| 強調した番号付きリスト | `ol.highlight-list` |

---

## 6. カスタマイズ方法（project.css）

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
/* themes/project.css */
:root {
  --color-primary:    #1b4d35;
  --color-accent:     #2d9e6b;
  --color-background: #f4f9f5;
}

/* ドットデコレーションも合わせて変更（SVGのためCSS変数は使えず直接上書き） */
section {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='20'%3E%3Crect x='0'  y='4' width='10' height='10' fill='%23a8c9b4'/%3E%3Crect x='14' y='4' width='10' height='10' fill='%235baa80'/%3E%3Crect x='28' y='4' width='10' height='10' fill='%232d7a50'/%3E%3Crect x='42' y='4' width='10' height='10' fill='%231b4d35'/%3E%3C/svg%3E");
}
```
→ `%23` は `#` のURLエンコード。各プリセットの値は `project.css` のコメントを参照してください。

---

## 7. コマンド運用

- カスタムコマンド定義は `.gemini/commands/` に置く
- 例: `/slide "トピック"`（詳細は `.gemini/commands/slide.md`）