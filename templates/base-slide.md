---
marp: true
theme: default
paginate: true
---

<!-- Chart.js CDN: グラフを使うスライドがある場合は必須。使わない場合は削除可 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4/dist/chart.umd.min.js"></script>

<!--
このファイルは「14〜15枚LT」の埋めるだけテンプレートです。
sample_slide.pdf のデザインコンポーネントに対応しています。

━━ 重要: テーマとCSSの関係 ━━━━━━━━━━━━━━━━━━━━━━
  theme: default  ← gaia はカスタムCSSを強制上書きするため使わない
  スタイルはすべて themes/base.css / charts.css / project.css で制御

━━ スライド区切り ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  --- （Marp 正式記法）を使う

━━ カスタマイズ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  配色・フォント → themes/project.css のみ編集
  グラフ・KPI・表 → SNIPPETS.md からコピペ

━━ 使い方 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  1) このファイルをコピーしてリネーム
  2) [...]を埋める
  3) bash scripts/build.sh <file>.md         ← 通常ビルド
     bash scripts/build.sh <file>.md --fetch ← 画像自動取得＋ビルド
-->

---

<!-- _class: title-slide -->

# [タイトル]

<div class="title-subtitle">[サブタイトル・キャッチコピー]</div>

[部署名・チーム名]

<div class="title-meta">作成者：[名前]　　作成日：[日付]</div>

---

<!-- _class: section-slide -->

<div class="sec-no">01</div>

<hr>

## 今日話すこと

---

<header><span>[スライドタイトル]</span><span class="header-en">Agenda</span></header>

## 今日話すこと

<div class="slide-no">01</div>

<ol class="highlight-list">
  <li><strong>[課題]</strong> ── [一言メモ]</li>
  <li><strong>[結論]</strong> ── [一言メモ]</li>
  <li><strong>[どうやったか]</strong> ── [一言メモ]</li>
  <li><strong>[得られた学び]</strong> ── [一言メモ]</li>
</ol>

---

<header><span>[スライドタイトル]</span><span class="header-en">Issue</span></header>

## こんなことで困っていませんか？

<div class="slide-no">02</div>

<span class="label issue">ISSUE</span>

- [あるある課題 1行目]
- [あるある課題 2行目]
- [あるある課題 3行目]

---

<header><span>[スライドタイトル]</span><span class="header-en">Pain</span></header>

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

---

<header><span>[スライドタイトル]</span><span class="header-en">Conclusion</span></header>

## 結論（最初に一番言いたいこと）

<div class="slide-no">04</div>

<span class="label vision">VISION</span>

**[一番伝えたい結論を太字で1文]**

- [補足1]
- [補足2]

---

<header><span>[スライドタイトル]</span><span class="header-en">Context</span></header>

## 背景・前提

<div class="slide-no">05</div>

<span class="label topic">TOPIC</span>

- [前提1]
- [前提2]
- [制約/条件]

---

<header><span>[スライドタイトル]</span><span class="header-en">Approach</span></header>

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

<!-- 画像がある場合: fetch-image.sh で取得してパスを指定 -->
<!-- fetch-image: "business strategy" 1 approach -->
<!-- ![アプローチ図](assets/images/approach.jpg) -->

<!-- 画像未準備の場合: 表で代替 -->
| 要素 | ねらい |
|---|---|
| [A] | [狙い] |
| [B] | [狙い] |
| [C] | [狙い] |

  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Point 1</span></header>

## ポイント①：[見出し]

<div class="slide-no">07</div>

<!-- パターンA: テキスト＋画像（2カラム） -->
<div class="cols">
  <div>

  - [具体例1]
  - [具体例2]
  - [得られた効果]

  </div>
  <div>

<!-- fetch-image: "data visualization" 1 point1 -->
<!-- ![説明](assets/images/point1.jpg) -->
<div class="img-placeholder">📷 画像を配置<br><small>fetch-image.sh で取得</small></div>

  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Point 2</span></header>

## ポイント②：[見出し]

<div class="slide-no">08</div>

- [具体例]
- [得られた効果]

---

<header><span>[スライドタイトル]</span><span class="header-en">Point 3</span></header>

## ポイント③：[見出し]

<div class="slide-no">09</div>

- [具体例]
- [得られた効果]

---

<header><span>[スライドタイトル]</span><span class="header-en">Result</span></header>

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

---

<header><span>[スライドタイトル]</span><span class="header-en">Performance</span></header>

## 実績サマリー

<div class="slide-no">11</div>

<!--
  グラフ or KPIカード を選択して使ってください。
  SNIPPETS.md に棒グラフ・折れ線・ドーナツ等のサンプルあり。
-->

<!-- パターンA: KPIカード（数値を大きく見せる） -->
<div class="kpi-cards">
  <div class="kpi-card">
    <div class="kpi-label">[指標名1]</div>
    <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
    <div class="kpi-delta up">[前比較]</div>
  </div>
  <div class="kpi-card accent">
    <div class="kpi-label">[指標名2]</div>
    <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
    <div class="kpi-delta up">[前比較]</div>
  </div>
  <div class="kpi-card positive">
    <div class="kpi-label">[指標名3]</div>
    <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
    <div class="kpi-delta up">[前比較]</div>
  </div>
</div>

<!-- パターンB: KPIカード＋棒グラフ（SNIPPETS.md の SNIPPET 03 参照） -->
<!-- パターンC: トピックカード（topic-cards） -->

---

<header><span>[スライドタイトル]</span><span class="header-en">Data</span></header>

## データ詳細

<div class="slide-no">12</div>

<!--
  表とグラフを横並びにするレイアウト例。
  片方だけでも使えます。
-->

<div class="cols">
  <div>

<table class="data-table">
  <thead>
    <tr>
      <th>[項目]</th>
      <th class="num">[目標]</th>
      <th class="num">[実績]</th>
      <th class="num">[達成率]</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>[行1]</td>
      <td class="num">[値]</td>
      <td class="num">[値]</td>
      <td class="num"><span class="badge over">[%]</span></td>
    </tr>
    <tr>
      <td>[行2]</td>
      <td class="num">[値]</td>
      <td class="num">[値]</td>
      <td class="num"><span class="badge meet">[%]</span></td>
    </tr>
  </tbody>
</table>

  </div>
  <div>

<!-- グラフを右カラムに配置（SNIPPETS.md SNIPPET 03 参照） -->
<div class="chart-wrap" style="height:200px">
  <canvas id="summaryChart"></canvas>
</div>
<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const primary = getComputedStyle(document.documentElement).getPropertyValue('--color-primary').trim() || '#1e2d6e';
    const accent  = getComputedStyle(document.documentElement).getPropertyValue('--color-accent').trim()  || '#2ab4b4';
    new Chart(document.getElementById('summaryChart'), {
      type: 'bar',
      data: {
        labels: ['[項目1]', '[項目2]'],
        datasets: [{ label: '達成率', data: [100, 100], backgroundColor: [primary, accent], borderRadius: 3 }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: { min: 0, max: 150, ticks: { callback: v => v + '%', font: { size: 10 } }, grid: { color: '#e0e4ee' } },
          x: { ticks: { font: { size: 10 } }, grid: { display: false } }
        }
      }
    });
  }
  init();
})();
</script>

  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Looking Ahead</span></header>

## 下半期に向けた展望

<div class="slide-no">13</div>

<div class="vision-label">VISION 01　[ビジョン名1]</div>
<div class="vision-block">[一言で表すビジョン]</div>
<div class="vision-note">[補足説明]</div>

<div class="vision-label">VISION 02　[ビジョン名2]</div>
<div class="vision-block">[一言で表すビジョン]</div>
<div class="vision-note">[補足説明]</div>

<div class="vision-label">VISION 03　[ビジョン名3]</div>
<div class="vision-block">[一言で表すビジョン]</div>
<div class="vision-note">[補足説明]</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Next Action</span></header>

## まとめ：明日からできること

<div class="slide-no">14</div>

<span class="label tips">TIPS</span>

1. [明日からやること①]
2. [明日からやること②]
3. [明日からやること③]

---

<header><span>[スライドタイトル]</span><span class="header-en">Questions</span></header>

## Q&A

<div class="slide-no">15</div>

ご清聴ありがとうございました。