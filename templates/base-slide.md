---
marp: true
theme: default
paginate: true
---

<!--
このファイルは「14〜15枚LT」の埋めるだけテンプレートです。
sample_slide.pdf のデザインコンポーネントに対応しています。

- スライド区切りは `<!-- スライド区切り -->`
- ラベル/カード/ステップ等は themes/base.css のコンポーネントを使用
- 配色・フォントのカスタマイズは themes/project.css のみ編集

使い方:
1) このファイルをコピーして作業用にリネーム
2) `[...]` を埋める
3) `bash scripts/build.sh <file>.md`
-->

<!-- スライド区切り -->

<!-- _class: title-slide -->

# [タイトル]

<div class="title-subtitle">[サブタイトル・キャッチコピー]</div>

[部署名・チーム名]

<div class="title-meta">作成者：[名前]　　作成日：[日付]</div>

<!-- スライド区切り -->

<!-- _class: section-slide -->

<div class="sec-no">01</div>

---

## 今日話すこと

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Agenda</span></header>

## 今日話すこと

<div class="slide-no">01</div>

<ol class="highlight-list">
  <li><strong>[課題]</strong> ── [一言メモ]</li>
  <li><strong>[結論]</strong> ── [一言メモ]</li>
  <li><strong>[どうやったか]</strong> ── [一言メモ]</li>
  <li><strong>[得られた学び]</strong> ── [一言メモ]</li>
</ol>

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Issue</span></header>

## こんなことで困っていませんか？

<div class="slide-no">02</div>

<span class="label issue">ISSUE</span>

- [あるある課題 1行目]
- [あるある課題 2行目]
- [あるある課題 3行目]

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Pain</span></header>

## 課題の具体例

<div class="slide-no">03</div>

<div class="issue-block">
  <div class="issue-no">ISSUE<span>01</span></div>
  <div>
    <div class="issue-title">[課題タイトル1]</div>
    <ul>
      <li>[どこで詰まるか]</li>
      <li>[何が無駄か・どんな影響があるか]</li>
    </ul>
  </div>
</div>

<div class="issue-block">
  <div class="issue-no">ISSUE<span>02</span></div>
  <div>
    <div class="issue-title">[課題タイトル2]</div>
    <ul>
      <li>[具体的な症状・数値があれば記載]</li>
    </ul>
  </div>
</div>

<div class="guide">（書き方例）できれば「数字」や「頻度」を1つ入れると刺さります。</div>

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Conclusion</span></header>

## 結論（最初に一番言いたいこと）

<div class="slide-no">04</div>

<span class="label vision">VISION</span>

**[一番伝えたい結論を太字で1文]**

- [補足1]
- [補足2]

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Context</span></header>

## 背景・前提

<div class="slide-no">05</div>

<span class="label topic">TOPIC</span>

- [前提1]
- [前提2]
- [制約/条件]

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Approach</span></header>

## アプローチ全体像

<div class="slide-no">06</div>

<div class="cols">
  <div>
    <ol class="highlight-list">
      <li><strong>[方針①]</strong> ── [狙い]</li>
      <li><strong>[方針②]</strong> ── [狙い]</li>
      <li><strong>[方針③]</strong> ── [狙い]</li>
    </ol>
  </div>
  <div>
    <div class="guide">（図を置く場合）画像を置く / 簡単な表で整理する</div>

    | 要素 | ねらい |
    |---|---|
    | [A] | [狙い] |
    | [B] | [狙い] |
  </div>
</div>

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Point 1</span></header>

## ポイント①：[見出し]

<div class="slide-no">07</div>

- [具体例]
- [得られた効果]

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Point 2</span></header>

## ポイント②：[見出し]

<div class="slide-no">08</div>

- [具体例]
- [得られた効果]

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Point 3</span></header>

## ポイント③：[見出し]

<div class="slide-no">09</div>

- [具体例]
- [得られた効果]

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Result</span></header>

## Before / Action / After

<div class="slide-no">10</div>

<div class="step-list">
  <div class="step-item before">
    <div class="step-label">Before</div>
    <div class="step-content">
      <div class="step-title">取り組みの背景</div>
      <ul>
        <li>[課題/状態1]</li>
        <li>[課題/状態2]</li>
      </ul>
    </div>
  </div>
  <div class="step-item action">
    <div class="step-label">Action</div>
    <div class="step-content">
      <div class="step-title">実施したこと</div>
      <ul>
        <li>[やったこと1]</li>
        <li>[やったこと2]</li>
      </ul>
    </div>
  </div>
  <div class="step-item tips">
    <div class="step-label">Tips</div>
    <div class="step-content">
      <div class="step-title">工夫した点</div>
      <ul>
        <li>[工夫点1]</li>
      </ul>
    </div>
  </div>
  <div class="step-item after">
    <div class="step-label">After</div>
    <div class="step-content">
      <div class="step-title">得られた成果</div>
      <ul>
        <li>[成果1]</li>
        <li>[成果2]</li>
      </ul>
    </div>
  </div>
</div>

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Use case</span></header>

## 応用：実績サマリー

<div class="slide-no">11</div>

<div class="topic-cards">
  <div class="topic-card">
    <div class="tc-label">TOPIC 01</div>
    <div class="tc-title">[トピック名1]</div>
    <div class="tc-tag">[タグ1／タグ2／タグ3]</div>
    <p>[内容説明。3〜4行を目安に。数値・成果があると◎]</p>
  </div>
  <div class="topic-card">
    <div class="tc-label">TOPIC 02</div>
    <div class="tc-title">[トピック名2]</div>
    <div class="tc-tag">[タグ1／タグ2／タグ3]</div>
    <p>[内容説明。3〜4行を目安に。]</p>
  </div>
  <div class="topic-card">
    <div class="tc-label">TOPIC 03</div>
    <div class="tc-title">[トピック名3]</div>
    <div class="tc-tag">[タグ1／タグ2／タグ3]</div>
    <p>[内容説明。3〜4行を目安に。]</p>
  </div>
</div>

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Looking Ahead</span></header>

## 下半期に向けた展望

<div class="slide-no">12</div>

<div class="vision-label">VISION 01　[ビジョン名1]</div>
<div class="vision-block">[一言で表すビジョン]</div>
<div class="vision-note">[補足説明]</div>

<div class="vision-label">VISION 02　[ビジョン名2]</div>
<div class="vision-block">[一言で表すビジョン]</div>
<div class="vision-note">[補足説明]</div>

<div class="vision-label">VISION 03　[ビジョン名3]</div>
<div class="vision-block">[一言で表すビジョン]</div>
<div class="vision-note">[補足説明]</div>

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Next Action</span></header>

## まとめ：明日からできること

<div class="slide-no">13</div>

<span class="label tips">TIPS</span>

1. [明日からやること①]
2. [明日からやること②]
3. [明日からやること③]

<!-- スライド区切り -->

<header><span>[スライドタイトル（日本語）]</span><span class="header-en">Questions</span></header>

## Q&A

<div class="slide-no">14</div>

ご清聴ありがとうございました。