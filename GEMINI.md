# GEMINIコンテキスト: Marp AI Starter（プロジェクト前提・ルール）

このファイルは、AI（Gemini CLI / Claude Code など）がこのリポジトリで作業する際に守るべき **前提** と **運用ルール** をまとめたものです。

---

## 1. ディレクトリ構成と各ファイルの役割

| ディレクトリ / ファイル | 役割 | Git管理 | 備考 |
|---|---|---|---|
| `.gemini/commands/` | AIカスタムコマンド定義 | 〇 | `/slide` などのプロンプトを管理 |
| **`slides/`** | **スライド用 Markdown 保存先** | **×** | AIがドラフトを出力する作業用ディレクトリ |
| `themes/` | スタイルシート（CSS） | 〇 | ビルド時に自動で読み込まれる |
| 　├ `base.css` | 基本デザイン（土台） | 〇 | **編集禁止** |
| 　├ `charts.css` | コンポーネント用スタイル | 〇 | **編集禁止** |
| 　└ **`project.css`** | **個別カスタマイズ** | 〇 | **ここだけ編集**。色・フォントの上書き用 |
| `templates/base-slide.md` | **AIが参照するスライド骨格テンプレート** | 〇 | AIがドラフト生成の起点に使う。ユーザーは直接触らない |
| `templates/SNIPPETS.md` | **AIが参照するコンポーネント素材集** | 〇 | AIがドラフト生成時に自動組み込む。ユーザーは直接触らない |
| `scripts/` | 実行スクリプト | 〇 | `build.sh` (ビルド), `fetch-image.sh` (画像) |
| `assets/images/` | 画像アセット | **×** | 取得した画像が保存される場所 |
| `dist/` | ビルド成果物 | **×** | 生成された PDF / HTML の出力先 |
| **`documents/`** | **参考資料** | **×** | スライド生成時にAIが参照するPDFやテキスト |

---

## 2. スライド生成の基本フロー（AI用）

1. **Phase 0-1: ヒアリングと合意**
   - 必要に応じて `documents/` 内の参考資料を確認する。
   - 構成案（タイトルのみ）が固まるまで、Markdown の生成は行わない。
2. **Phase 2: ドラフト作成と保存**
   - `templates/base-slide.md` を骨格として参照し、`slides/` ディレクトリ配下に保存する。
   - `templates/SNIPPETS.md` を参照し、各スライドに最適なコンポーネントを **AIが判断して自動組み込む**。ユーザーに選択を委ねない。
3. **Phase 3: ユーザーレビュー（必須）**
   - ファイルを作成したら作業を中断し、ユーザーにレビューを促す。
   - **ユーザーがやることは「内容・数値の確認と修正」のみ**。デザインや構成要素の選択はAIの責務。
4. **Phase 4: ビルド実行**
   - ユーザーの修正完了を確認後、`scripts/build.sh` を使用してビルドを案内する。

---

## 3. コンポーネント自動選択マッピング（スライドタイプ別）

AIはドラフト生成時、以下のマッピングに従ってコンポーネントを**自動的に**選択・組み込むこと。ユーザーに「SNIPPETSを参照してください」と言ってはならない。

### 表紙（title-slide）
- `<!-- _class: title-slide -->`
- `.title-eyebrow` に `.pill` バッジ（日付・組織名）
- `# タイトル` の下に `.title-subtitle`（キャッチコピー）
- `.title-footer-row` に作成者・部署・日付

### セクション区切り（section-slide）
- `<!-- _class: section-slide -->`
- `.sec-no` に章番号
- `<hr>` の後に `## 章タイトル` と `.subtitle-en`

### アジェンダ・目次
- `.cols-half` で2カラム構成
- 左: `ol.highlight-list` で項目列挙
- 右: `.stat-row` で「枚数・時間・Key Points」などの概要数値

### 課題提示（Issue）
- `.cols` で2カラム構成
- 左: `span.label.issue` + `ul.check-list`（3〜4項目）+ `.data-insight.warn`
- 右: 定量データがある場合は `.kpi-cards.cols-2`（negativeバリアント）、またはグラフ（SNIPPET 03）

### 課題の詳細（Pain Point）
- `.cols` で2カラム構成
- 左: `.issue-block` を2〜3個（`issue-no` + `issue-title` + `ul`）
- 右: `.progress-list`（影響度の可視化）+ `.kpi-cards.cols-2`

### 結論・ソリューション
- `.cols-half` で2カラム構成
- 左: `span.label.vision` + 太字の結論文 + `.vision-block`（一言キャッチ）
- 右: `.kpi-cards.cols-2`（positive/accentバリアント）+ `.data-insight.success`

### アプローチ・方法論
- `.cols-half` で2カラム構成
- 左: `ol.highlight-list`（手順・ポイント）
- 右: `.step-list`（before/action/after カード）または `data-table`（SNIPPET 02）
- **特徴・機能を3点で説明する場合**: SNIPPET 14（`.icon-cols`）を全幅で使う

### 課題解決・施策効果
- **Before/After の対比を見せたい場合**: SNIPPET 13（`.compare-wrap`）+ 下部に `.stat-row` で数値まとめ
- 定量データがある場合は右カラムに `.kpi-cards` を添える

### データ・実績（Performance）
- 全幅または `.cols` で構成
- 数値強調: `.kpi-cards`（4枚横並び）+ `.callout-wrap`
- グラフ: SNIPPET 03（棒）または SNIPPET 11（複合）
- 補足: `.data-insight.success` または `.data-insight.warn`

### 展望・ロードマップ
- `.cols` で2カラム構成
- 左: `.vision-label` + `.vision-block` + `.vision-note` を2〜3セット
- 右: `.timeline`（4〜5ステップ）+ `.data-insight`

### まとめ・Next Action
- `.cols` で2カラム構成
- 左: `span.label.tips` + `ol.highlight-list`（明日からできること）+ `.guide`
- 右: `.kpi-cards.cols-2`（accent/positiveバリアント）+ `.data-insight.success`

### Q&A・エンド
- `<!-- _class: section-slide -->`
- `.section-desc` にメッセージ
- `.pill` バッジ（連絡先・URL等）

### 顧客の声・事例・フィードバック
- **1件の強力な声を大きく見せる場合**: SNIPPET 15 パターンA（`.bq-card`）+ 右カラムに `.kpi-cards`
- **複数の声を並べて信頼性を高める場合**: SNIPPET 15 パターンB（`.bq-row.cols-3 > .bq-mini`）

### 価値提案・特徴紹介
- **3〜4つの特徴をアイコンで視覚化する場合**: SNIPPET 14（`.icon-cols`）を全幅で使う
- 各 `.icon-col` にアイコン絵文字・タイトル・説明文・バッジを組み込む

---

## 4. デザイン・エンジニアリング・ガイドライン

### A. レイアウトの原則
- **2カラム構成の優先**: 情報を整理する際は必ず `.cols` / `.cols-half` を使用し、左右にテキストとビジュアルを振り分ける。
- **背景クラスの使い分け**: スライドの役割に応じて `<!-- _class: ... -->` を必ず冒頭に記述する。
  - `title-slide`: 表紙（ダークネイビー背景）
  - `section-slide`: 章の区切り
  - 通常スライド: クラス指定不要（白背景）

### B. タイポグラフィ階層（厳守）

| 役割 | 記法・クラス | フォントサイズ目安 |
|---|---|---|
| スライドタイトル | `## 見出し` | 1.32em（CSS固定） |
| サブ見出し | `### 小見出し` / `.label` | 1.02em |
| 本文・説明文 | `.check-list` / `.highlight-list` などコンポーネント内 | 0.82〜0.88em |
| 補足・注釈 | `.text-muted` / `font-size:0.75em` 指定 | 0.72〜0.78em |

- `<ul>` / `<ol>` / `<div>` を生テキストで書かない。必ずコンポーネントを使うか `style="font-size:0.85em"` を付ける。
- 1スライドあたりのテキスト行数上限: **15〜18行**。超える場合はスライドを分割する。

### C. グラフの使い方
- 統計データが含まれるスライドには必ずグラフを組み込む。`SNIPPETS.md` のスクリプトをそのままコピーしてデータのみ差し替える。
- 色は必ず CSS 変数から取得する（`getComputedStyle` 経由）。ハードコードしない。
- Chart.js グラフは `<canvas id="[一意なID]">` を使う。同一スライドファイル内で同じIDを重複させない。

---

## 5. 【再発防止】3大バグと対策

### 🔴 バグ①: PDF に画像パスの文字列が表示される

**ルール**:
- スライド本文内の画像は必ず Marp のネイティブ記法を使う。
  - 背景画像: `![bg left:40%](assets/images/xxx.jpg)`
  - インライン: `![width:400px](assets/images/xxx.jpg)`
- ファイルが未取得の場合は `<div class="img-placeholder">` を使い、`<img>` タグは**絶対に書かない**。
- `fetch-image.sh` で取得予定の場合は `<!-- fetch-image: "keyword" -->` コメントを書く。

### 🔴 バグ②: HTMLタグが文字のまま表示される

**ルール**:
- すべてのスライドファイルの先頭に必ず以下を含める:
  ```yaml
  ---
  marp: true
  theme: ark-base
  paginate: true
  ---
  ```
- ビルドは必ず `build.sh` を通す（`--html` フラグが自動付与される）。
- 直接 `marp` コマンドを使う場合は必ず `--html` を付ける。

### 🔴 バグ③: テキストがスライドから溢れる

**ルール**:
- 生の `<ul>` / `<ol>` / `<p>` を `.cols` 内に直書きしない。`.check-list` / `.highlight-list` などのコンポーネントを使う。
- `.cols` / `.cols-half` 内の各カラムは **6〜8行以内** を目安とする。
- 説明文に `font-size` 未指定の `<div>` を使わない。必ず `style="font-size:0.85em"` または `.body-text` クラスを付ける。

---

## 6. 画像とグラフの技術仕様
- 画像: `<!-- fetch-image: ... -->` を使い、`assets/images/` 配下のファイルを参照。
- グラフ: `Chart.js` を使用し、色は `project.css` の CSS 変数から取得して動的に反映。