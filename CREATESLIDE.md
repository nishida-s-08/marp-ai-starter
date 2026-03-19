# スライド生成フロー（このリポジトリで実行可能な範囲）

## 1. 概要

このドキュメントは、AI（Gemini CLI / Claude Code など）で Marp 形式のスライドMarkdownを作成し、
`marp` コマンドで PDF / HTML / PPTX を出力するまでのワークフローを定義します。

---

## 2. 参照ファイル

| ファイル | 用途 |
|---|---|
| `GEMINI.md` | AIへの指示・コンポーネント一覧・カスタマイズ方法 |
| `themes/base.css` | sample_slide.pdf 準拠のベースデザイン（触らない） |
| `themes/project.css` | プロジェクトごとの配色・フォント上書き（ここだけ編集） |
| `templates/base-slide.md` | 14枚LTの型テンプレート |

---

## 3. 実行フロー

### ステップ1: プロジェクトのカスタマイズ（任意）

`themes/project.css` を開き、使いたいカラーセットのコメントを外すだけです。

```css
/* themes/project.css の例: グリーンテーマに切り替え */
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

**プリセット一覧（GEMINI.md にも記載）:**
- ARK GRAPHICS デフォルト（sample_slide.pdf 準拠）
- モノクロ / コーポレートグレー
- グリーン（環境・サステナビリティ）
- ウォームオレンジ（スタートアップ・カジュアル）
- パープル（テック・AI）

### ステップ2: トピックを決める

```bash
/slide "開発組織におけるAI活用のはじめ方"
```

> `/slide` はまず「14枚の構成案（番号付き）」だけを提示し、承認後に本文生成へ進みます。

**または、テンプレートを直接コピーして埋める方式:**
```bash
cp templates/base-slide.md my-talk.md
```

#### 生成される構成（LT 14〜15枚のアウトライン例）

1. 表紙（タイトル / 氏名 / 所属）
2. 今日話すこと（アジェンダ）
3. 導入：問いかけ（あるある課題）
4. 導入：課題の具体例（痛みの描写）
5. 結論：一番伝えたいこと（1枚で）
6. 本論：背景・前提（なぜそれが起きるか）
7. 本論：アプローチ全体像（図 or 3点要約）
8. 本論：ポイント①（具体例）
9. 本論：ポイント②（具体例）
10. 本論：ポイント③（具体例）
11. Before / Action / Tips / After（施策と効果）
12. 実績サマリー（TOPICカード3列）
13. 展望（VISIONブロック）
14. まとめ：明日からできること（Next Action）
15. Q&A

### ステップ3: 生成された Markdown を微調整する

- 事実関係や自社固有情報（数値・用語・体制）を追記
- 1枚1メッセージになっているかを確認
- コンポーネントの使い方は `GEMINI.md` の「コンポーネント一覧」を参照

#### コンポーネント選択の目安

| 伝えたい内容 | 使うコンポーネント |
|---|---|
| 課題の列挙 | `.issue-block` |
| 施策と効果の流れ | `.step-list`（Before/Action/Tips/After） |
| 3つのトピックをカード形式で | `.topic-cards` |
| 将来の方向性 | `.vision-block` |
| 3点比較（横並び） | `.cards`（Before/Action/After） |
| 本文＋図表 | `.cols` |
| 強調した番号付きリスト | `ol.highlight-list` |

### ステップ4: PDF / HTML / PPTX を出力する

#### PDF / HTML
```bash
# デフォルト: Marp組み込みテーマの影響を避けるため "default" テーマでビルド
bash scripts/build.sh slide-deck.md

# もし gaia テーマも併用したい場合は明示指定
bash scripts/build.sh --theme gaia slide-deck.md
```

#### PPTX（PowerPoint）
```bash
mkdir -p slide
marp slide-deck.md --pptx --allow-local-files --theme gaia \
  --stylesheet themes/base.css \
  --stylesheet themes/project.css \
  -o slide/slide-deck.pptx
```

> Note: marp のPPTXは表現に制約があります。凝ったレイアウトはPDFの方が再現性が高いです。

---

## 4. よくある質問

**Q. 配色だけ変えたい**
→ `themes/project.css` の `:root` に変数を上書きするだけです。プリセットは `GEMINI.md` と `project.css` のコメントに記載されています。

**Q. フォントを変えたい**
→ `themes/project.css` で `--font-family-main` と `--font-family-heading` を上書きします。Google Fonts 等を使う場合は `build.sh` に `@import` を追加してください。

**Q. ロゴを入れたい**
→ `themes/project.css` に追記するか、各スライドの `<header>` にHTMLで埋め込みます。

**Q. コンポーネントの見た目を変えたい**
→ `themes/project.css` に `.card`, `.issue-block` 等のスタイルを追記して上書きします。`themes/base.css` は編集しないでください。