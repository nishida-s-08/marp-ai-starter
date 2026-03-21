---
marp: true
theme: ark-base
paginate: true
---

<script src="https://cdn.jsdelivr.net/npm/chart.js@4/dist/chart.umd.min.js"></script>

<!--
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  LT テンプレート — MODERN EDITION
  base.css + charts.css (Modern Edition) 対応
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ── スライドバリエーション一覧 ──────────────────────────
  1.  title-slide          : タイトル（ダーク背景）
  2.  section-slide        : セクション区切り
  3.  Agenda               : 番号付きリスト (highlight-list)
  4.  Issue シンプル       : label + bullet
  5.  Issue ブロック       : issue-block × 2 + 2カラム
  6.  Conclusion           : vision-block + stat-row 強調
  7.  Context              : topic + check-list + pill タグ
  8.  Approach             : cols + highlight-list + table
  9.  Point ①             : cols + img-placeholder + data-insight
  10. Point ②             : cols-half + progress-list + kpi mini
  11. Point ③             : step-list (Before/Action/Tips/After)
  12. Performance          : kpi-cards (4枚) + callout
  13. Data                 : data-table + Chart.js 棒グラフ
  14. Looking Ahead        : vision × 3 + timeline
  15. Summary & Next       : highlight-list + guide
  16. Q&A                  : シンプルエンドスライド
  ────────────────────────────────────────────────────────

  ── ビルド ───────────────────────────────────────────────
  bash scripts/build.sh <file>.md
  bash scripts/build.sh <file>.md --fetch  ← 画像自動取得
  ────────────────────────────────────────────────────────
-->

---

<!-- _class: title-slide -->

<div class="title-eyebrow">
  <span class="pill accent">2025 Q3 Report</span>
  <span class="pill primary">ARK GRAPHICS Inc.</span>
</div>

# [タイトル]<br><span style="color:var(--color-accent); font-size:0.65em; font-weight:300; letter-spacing:0.04em;">[英語サブタイトル]</span>

<div class="title-subtitle">[サブタイトル・キャッチコピー]</div>

<div class="title-footer-row">
  <div class="title-meta">
    <span>[部署名・チーム名]</span>
    <span>作成者：[名前]</span>
    <span>[日付]</span>
  </div>
  <div class="title-badge-row">
    <span class="label topic">TOPIC</span>
    <span class="label tips">TIPS</span>
  </div>
</div>

---

<!-- _class: section-slide -->

<div class="sec-no">01</div>

<hr>

## 今日話すこと
<span class="subtitle-en">Agenda</span>

<div class="section-desc">本セッションでは [テーマ] についてお伝えします。</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Agenda</span></header>

## 今日話すこと

<div class="slide-no">01</div>

<div class="cols-half">
  <div>
    <ol class="highlight-list">
      <li><strong>[課題]</strong> ── [一言メモ]</li>
      <li><strong>[結論]</strong> ── [一言メモ]</li>
      <li><strong>[どうやったか]</strong> ── [一言メモ]</li>
      <li><strong>[得られた学び]</strong> ── [一言メモ]</li>
    </ol>
  </div>
  <div>
    <!-- サマリーKPI（任意で入れるとリッチになる） -->
    <div class="stat-row" style="margin-top:0;">
      <div class="stat-item highlight">
        <div class="stat-num">[X]<span style="font-size:0.5em;font-weight:400;color:var(--color-muted)">分</span></div>
        <div class="stat-label">話す時間</div>
      </div>
      <div class="stat-item">
        <div class="stat-num">[X]</div>
        <div class="stat-label">スライド</div>
      </div>
      <div class="stat-item">
        <div class="stat-num">[X]</div>
        <div class="stat-label">Key Points</div>
      </div>
    </div>
    <div class="data-insight" style="margin-top:12px;">
      <div class="di-icon">💡</div>
      <div class="di-text">本日の最重要メッセージ：<strong>[一言で結論]</strong></div>
    </div>
    <div class="guide">発表後にスライドを共有予定です。メモは最小限でOK。</div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Issue</span></header>

## こんなことで困っていませんか？

<div class="slide-no">02</div>

<div class="cols">
  <div>
    <span class="label issue">ISSUE</span>

    <ul class="check-list" style="margin-top:12px;">
      <li>[あるある課題 1行目]</li>
      <li>[あるある課題 2行目]</li>
      <li>[あるある課題 3行目]</li>
    </ul>

    <div class="data-insight warn" style="margin-top:16px;">
      <div class="di-icon">⚠️</div>
      <div class="di-text">放置すると<strong>[〇〇のリスク]</strong>が発生する可能性があります。</div>
    </div>
  </div>
  <div>
    <div class="img-placeholder" style="min-height:260px;">
      📊 課題を示す<br>グラフ・図を配置
      <small>fetch-image.sh で取得 or Chart.js</small>
    </div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Pain</span></header>

## 課題の具体例

<div class="slide-no">03</div>

<div class="cols">
  <div>
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

    <div class="issue-block">
      <div class="issue-no">ISSUE<span>03</span></div>
      <div>
        <div class="issue-title">[課題タイトル3]</div>
        <ul>
          <li>[影響範囲・コスト・頻度など]</li>
        </ul>
      </div>
    </div>
  </div>
  <div>
    <!-- 課題の定量インパクトをKPIで強調 -->
    <div class="kpi-cards cols-2" style="gap:10px;margin-top:0;">
      <div class="kpi-card negative">
        <div class="kpi-label">影響コスト</div>
        <div class="kpi-value">[X]<span class="kpi-unit">万円</span></div>
        <div class="kpi-sub">年間推計</div>
      </div>
      <div class="kpi-card negative">
        <div class="kpi-label">無駄な工数</div>
        <div class="kpi-value">[X]<span class="kpi-unit">h/月</span></div>
        <div class="kpi-sub">担当者平均</div>
      </div>
    </div>

    <div class="progress-list" style="margin-top:16px;">
      <div class="progress-row">
        <div class="pr-label">[影響度 A]</div>
        <div class="pr-bar-wrap"><div class="pr-bar" style="width:[X]%"></div></div>
        <div class="pr-val">[X]%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">[影響度 B]</div>
        <div class="pr-bar-wrap"><div class="pr-bar primary" style="width:[X]%"></div></div>
        <div class="pr-val">[X]%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">[影響度 C]</div>
        <div class="pr-bar-wrap"><div class="pr-bar" style="width:[X]%"></div></div>
        <div class="pr-val">[X]%</div>
      </div>
    </div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Conclusion</span></header>

## 結論（最初に一番言いたいこと）

<div class="slide-no">04</div>

<div class="cols-half">
  <div>
    <span class="label vision">VISION</span>

    <div style="margin-top:14px; font-size:1.15em; font-weight:800; color:var(--color-primary); line-height:1.45; letter-spacing:-0.01em;">
      [一番伝えたい結論を<br>太字・大きめで1〜2文]
    </div>

    <div class="vision-block" style="margin-top:16px;">[一言で表すビジョン・キャッチ]</div>

    <ul style="margin-top:12px; font-size:0.88em;">
      <li>[補足1]</li>
      <li>[補足2]</li>
    </ul>
  </div>
  <div>
    <!-- 結論を支える数値 -->
    <div class="kpi-cards cols-2" style="margin-top:0; gap:10px;">
      <div class="kpi-card positive">
        <div class="kpi-label">[成果指標1]</div>
        <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
        <div class="kpi-delta up">[前期比]</div>
      </div>
      <div class="kpi-card accent">
        <div class="kpi-label">[成果指標2]</div>
        <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
        <div class="kpi-delta up">[前期比]</div>
      </div>
    </div>

    <div class="data-insight success" style="margin-top:14px;">
      <div class="di-icon">✅</div>
      <div class="di-text"><strong>[施策名]</strong>が最大の貢献要因。[一言補足]</div>
    </div>
    <div class="data-insight" style="margin-top:6px;">
      <div class="di-icon">📌</div>
      <div class="di-text">詳細データは スライド [X] で解説します。</div>
    </div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Context</span></header>

## 背景・前提

<div class="slide-no">05</div>

<div class="cols">
  <div>
    <div style="display:flex;gap:8px;flex-wrap:wrap;margin-bottom:12px;">
      <span class="label topic">TOPIC</span>
      <span class="pill accent">[キーワード1]</span>
      <span class="pill primary">[キーワード2]</span>
      <span class="pill warm">[キーワード3]</span>
    </div>

    <ul class="check-list">
      <li>[前提1：なぜこの取り組みが必要か]</li>
      <li>[前提2：組織・技術・市場の背景]</li>
      <li>[制約 / 条件：スコープや期間]</li>
    </ul>

    <div class="divider accent"></div>

    <div class="stat-row" style="margin-top:0;">
      <div class="stat-item">
        <div class="stat-num">[X]</div>
        <div class="stat-label">[文脈数値1]</div>
      </div>
      <div class="stat-item highlight">
        <div class="stat-num">[X]</div>
        <div class="stat-label">[文脈数値2]</div>
      </div>
      <div class="stat-item">
        <div class="stat-num">[X]</div>
        <div class="stat-label">[文脈数値3]</div>
      </div>
    </div>
  </div>
  <div>
    <!-- タイムライン: 経緯・背景の時系列 -->
    <div class="timeline">
      <div class="timeline-item">
        <div class="tl-date">[時期 例: 2024 Q1]</div>
        <div class="tl-content">[背景・きっかけ]</div>
      </div>
      <div class="timeline-item">
        <div class="tl-date">[時期 例: 2024 Q3]</div>
        <div class="tl-content">[課題顕在化・検討開始]</div>
      </div>
      <div class="timeline-item">
        <div class="tl-date">[時期 例: 2025 Q1]</div>
        <div class="tl-content"><strong>[取り組み開始]</strong></div>
      </div>
      <div class="timeline-item">
        <div class="tl-date">NOW</div>
        <div class="tl-content">[現在の状況・本発表]</div>
      </div>
    </div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Approach</span></header>

## アプローチ全体像

<div class="slide-no">06</div>

<div class="cols">
  <div>
    <span class="label vision">VISION</span>

    <ol class="highlight-list" style="margin-top:12px;">
      <li><strong>[方針①]</strong> ── [狙いを1文で]</li>
      <li><strong>[方針②]</strong> ── [狙いを1文で]</li>
      <li><strong>[方針③]</strong> ── [狙いを1文で]</li>
    </ol>

    <div class="highlight-box" style="margin-top:14px;">
      💡 <strong>重点ポイント：</strong>[アプローチの核心・差別化ポイントを1文]
    </div>
  </div>
  <div>

<!-- 画像がある場合: -->
<!-- ![アプローチ図](assets/images/approach.jpg) -->

<!-- 画像なし → 表で代替 -->
<table class="data-table">
  <thead>
    <tr>
      <th>要素</th>
      <th>内容</th>
      <th>期待効果</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><span class="pill accent">[A]</span></td>
      <td>[内容]</td>
      <td class="num text-success">+[X]%</td>
    </tr>
    <tr>
      <td><span class="pill primary">[B]</span></td>
      <td>[内容]</td>
      <td class="num text-success">+[X]%</td>
    </tr>
    <tr>
      <td><span class="pill warm">[C]</span></td>
      <td>[内容]</td>
      <td class="num text-accent">−[X]h</td>
    </tr>
  </tbody>
</table>

  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Point 1</span></header>

## ポイント①：[見出し]

<div class="slide-no">07</div>

<div class="cols">
  <div>
    <span class="label topic">TOPIC</span>

    <ul style="margin-top:10px;">
      <li>[具体例1：何をしたか]</li>
      <li>[具体例2：どう変わったか]</li>
      <li>[得られた効果・数値]</li>
    </ul>

    <div class="data-insight success" style="margin-top:12px;">
      <div class="di-icon">📈</div>
      <div class="di-text"><strong>[定量的成果]</strong> — [一言補足]</div>
    </div>

    <div class="data-insight" style="margin-top:6px;">
      <div class="di-icon">🔑</div>
      <div class="di-text">ポイント：<strong>[この施策の核心]</strong></div>
    </div>
  </div>
  <div>

<!-- 画像がある場合 -->
<!-- fetch-image: "[keyword]" 1 point1 -->
<!-- ![説明](assets/images/point1.jpg) -->

<div class="img-wrap" style="height:240px;">
  <div class="img-placeholder" style="min-height:240px;">
    📷 スクリーンショット・図を配置<br>
    <small>fetch-image.sh で取得</small>
  </div>
</div>

  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Point 2</span></header>

## ポイント②：[見出し]

<div class="slide-no">08</div>

<div class="cols-half">
  <div>
    <span class="label topic">TOPIC</span>

    <ul style="margin-top:10px;">
      <li>[具体例1]</li>
      <li>[具体例2]</li>
      <li>[得られた効果]</li>
    </ul>

    <div class="highlight-box" style="margin-top:14px;">
      [この施策で気をつけたポイント・工夫]
    </div>
  </div>
  <div>
    <!-- プログレスバーで進捗や比率を可視化 -->
    <h3 style="font-size:0.82em;margin-bottom:8px;color:var(--color-muted);">達成状況</h3>
    <div class="progress-list" style="margin-top:0;">
      <div class="progress-row">
        <div class="pr-label">[指標1]</div>
        <div class="pr-bar-wrap"><div class="pr-bar success" style="width:[X]%"></div></div>
        <div class="pr-val">[X]%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">[指標2]</div>
        <div class="pr-bar-wrap"><div class="pr-bar" style="width:[X]%"></div></div>
        <div class="pr-val">[X]%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">[指標3]</div>
        <div class="pr-bar-wrap"><div class="pr-bar primary" style="width:[X]%"></div></div>
        <div class="pr-val">[X]%</div>
      </div>
    </div>

    <div class="kpi-cards cols-2" style="margin-top:14px;gap:10px;">
      <div class="kpi-card accent">
        <div class="kpi-label">[KPI名]</div>
        <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
        <div class="kpi-delta up">[比較]</div>
      </div>
      <div class="kpi-card positive">
        <div class="kpi-label">[KPI名]</div>
        <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
        <div class="kpi-delta up">[比較]</div>
      </div>
    </div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Point 3</span></header>

## ポイント③：[見出し]

<div class="slide-no">09</div>

<!-- step-list でプロセス・施策フローを見せる -->
<div class="step-list">
  <div class="step-item before">
    <div class="step-label">Before</div>
    <div class="step-content">
      <div class="step-title">取り組み前の状態</div>
      <ul>
        <li>[課題 / 状態1]</li>
        <li>[課題 / 状態2]</li>
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
      <div class="step-title">工夫した点・ハマったこと</div>
      <ul>
        <li>[工夫点 or 落とし穴]</li>
      </ul>
    </div>
  </div>
  <div class="step-item after">
    <div class="step-label">After</div>
    <div class="step-content">
      <div class="step-title">得られた成果</div>
      <ul>
        <li>[成果1・数値あれば記載]</li>
        <li>[成果2]</li>
      </ul>
    </div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Performance</span></header>

## 実績サマリー

<div class="slide-no">10</div>

<div class="callout-wrap">
  <span class="callout accent">📈 [ハイライトコメント — 最注目の数値や変化]</span>
</div>

<!-- KPIカード 4枚 -->
<div class="kpi-cards">
  <div class="kpi-card positive">
    <div class="kpi-label">[指標名1]</div>
    <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
    <div class="kpi-delta up">[前比較]</div>
    <div class="kpi-sub">[補足テキスト]</div>
  </div>
  <div class="kpi-card accent">
    <div class="kpi-label">[指標名2]</div>
    <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
    <div class="kpi-delta up">[前比較]</div>
    <div class="kpi-sub">[補足テキスト]</div>
  </div>
  <div class="kpi-card warm">
    <div class="kpi-label">[指標名3]</div>
    <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
    <div class="kpi-delta up">[前比較]</div>
    <div class="kpi-sub">[補足テキスト]</div>
  </div>
  <div class="kpi-card negative">
    <div class="kpi-label">[指標名4]</div>
    <div class="kpi-value">[値]<span class="kpi-unit">[単位]</span></div>
    <div class="kpi-delta down">[前比較]</div>
    <div class="kpi-sub">[補足テキスト]</div>
  </div>
</div>

<!-- 下部に stat-row でサブ数値を横並び -->
<div class="stat-row">
  <div class="stat-item">
    <div class="stat-num">[値]</div>
    <div class="stat-label">[サブ指標1]</div>
  </div>
  <div class="stat-item highlight">
    <div class="stat-num">[値]</div>
    <div class="stat-label">[サブ指標2]</div>
  </div>
  <div class="stat-item">
    <div class="stat-num">[値]</div>
    <div class="stat-label">[サブ指標3]</div>
  </div>
  <div class="stat-item">
    <div class="stat-num">[値]</div>
    <div class="stat-label">[サブ指標4]</div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Data</span></header>

## データ詳細

<div class="slide-no">11</div>

<div class="cols">
  <div>
    <div class="chart-title">[データタイトル]</div>

<table class="data-table">
  <thead>
    <tr>
      <th>[項目]</th>
      <th class="num">[目標]</th>
      <th class="num">[実績]</th>
      <th>[判定]</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>[行1]</td>
      <td class="num">[値]</td>
      <td class="num">[値]</td>
      <td><span class="badge over">[達成]</span></td>
    </tr>
    <tr>
      <td>[行2]</td>
      <td class="num">[値]</td>
      <td class="num">[値]</td>
      <td><span class="badge meet">[基準値]</span></td>
    </tr>
    <tr>
      <td>[行3]</td>
      <td class="num">[値]</td>
      <td class="num">[値]</td>
      <td><span class="badge under">[未達]</span></td>
    </tr>
    <tr>
      <td>[行4]</td>
      <td class="num">[値]</td>
      <td class="num">[値]</td>
      <td><span class="badge over">[超過]</span></td>
    </tr>
  </tbody>
</table>

    <div class="data-insight warn" style="margin-top:10px;">
      <div class="di-icon">⚠️</div>
      <div class="di-text">[行3] の未達要因：<strong>[原因を1文]</strong>。対策は次スライドで解説。</div>
    </div>
  </div>
  <div>
    <div class="chart-title">[グラフタイトル]</div>
    <div class="chart-wrap" style="height:220px">
      <canvas id="summaryChart"></canvas>
    </div>
<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const cs = getComputedStyle(document.documentElement);
    const primary = cs.getPropertyValue('--color-primary').trim() || '#0f1f5c';
    const accent  = cs.getPropertyValue('--color-accent').trim()  || '#06b6d4';
    const warm    = cs.getPropertyValue('--color-accent-warm').trim() || '#f59e0b';
    const success = '#10b981';
    new Chart(document.getElementById('summaryChart'), {
      type: 'bar',
      data: {
        labels: ['[項目1]', '[項目2]', '[項目3]', '[項目4]'],
        datasets: [
          {
            label: '目標',
            data: [100, 100, 100, 100],
            backgroundColor: 'rgba(15,31,92,0.12)',
            borderColor: primary,
            borderWidth: 1,
            borderRadius: 4
          },
          {
            label: '実績',
            data: [118, 94, 108, 72],
            backgroundColor: [success, '#ef4444', accent, warm],
            borderRadius: 4
          }
        ]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: {
          legend: { position: 'bottom', labels: { font: { size: 10 }, boxWidth: 10 } }
        },
        scales: {
          y: {
            min: 0, max: 140,
            ticks: { callback: v => v + '%', font: { size: 10 } },
            grid: { color: 'rgba(200,210,230,0.4)' }
          },
          x: { ticks: { font: { size: 10 } }, grid: { display: false } }
        }
      }
    });
  }
  init();
})();
</script>

    <div class="data-insight success" style="margin-top:10px;">
      <div class="di-icon">✅</div>
      <div class="di-text">全体平均達成率：<strong>[X]%</strong> — 前期比 +[X]pt</div>
    </div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Looking Ahead</span></header>

## 下半期に向けた展望

<div class="slide-no">12</div>

<div class="cols">
  <div>
    <div class="vision-label">VISION 01　[ビジョン名1]</div>
    <div class="vision-block">[一言で表すビジョン1]</div>
    <div class="vision-note">[補足説明]</div>

    <div class="vision-label" style="margin-top:10px;">VISION 02　[ビジョン名2]</div>
    <div class="vision-block">[一言で表すビジョン2]</div>
    <div class="vision-note">[補足説明]</div>

    <div class="vision-label" style="margin-top:10px;">VISION 03　[ビジョン名3]</div>
    <div class="vision-block">[一言で表すビジョン3]</div>
    <div class="vision-note">[補足説明]</div>
  </div>
  <div>
    <!-- タイムライン: 今後の計画 -->
    <h3 style="font-size:0.82em;margin-bottom:4px;">実施スケジュール</h3>
    <div class="timeline">
      <div class="timeline-item">
        <div class="tl-date">[月 / 時期1]</div>
        <div class="tl-content">[マイルストーン1]</div>
      </div>
      <div class="timeline-item">
        <div class="tl-date">[月 / 時期2]</div>
        <div class="tl-content">[マイルストーン2]</div>
      </div>
      <div class="timeline-item">
        <div class="tl-date">[月 / 時期3]</div>
        <div class="tl-content"><strong>[目標達成]</strong></div>
      </div>
    </div>

    <div class="data-insight" style="margin-top:12px;">
      <div class="di-icon">🎯</div>
      <div class="di-text">最終ゴール：<strong>[期末 / 年末に達成したい状態]</strong></div>
    </div>
  </div>
</div>

---

<header><span>[スライドタイトル]</span><span class="header-en">Next Action</span></header>

## まとめ：明日からできること

<div class="slide-no">13</div>

<div class="cols">
  <div>
    <span class="label tips">TIPS</span>

    <ol class="highlight-list" style="margin-top:12px;">
      <li><strong>[明日からやること①]</strong> ── [具体的にどうするか]</li>
      <li><strong>[明日からやること②]</strong> ── [具体的にどうするか]</li>
      <li><strong>[明日からやること③]</strong> ── [具体的にどうするか]</li>
    </ol>

    <div class="guide" style="margin-top:16px;">
      💬 [発表者コメント・補足メモ。スライドに書ける内容の限界を超えた場合に活用。]
    </div>
  </div>
  <div>
    <!-- 行動を後押しする定量メッセージ -->
    <div class="kpi-cards cols-2" style="margin-top:0;gap:10px;">
      <div class="kpi-card accent">
        <div class="kpi-label">工数削減目標</div>
        <div class="kpi-value">[X]<span class="kpi-unit">h/月</span></div>
        <div class="kpi-sub">施策①②で実現</div>
      </div>
      <div class="kpi-card positive">
        <div class="kpi-label">期待ROI</div>
        <div class="kpi-value">[X]<span class="kpi-unit">x</span></div>
        <div class="kpi-sub">6ヶ月想定</div>
      </div>
    </div>

    <div class="data-insight success" style="margin-top:12px;">
      <div class="di-icon">🚀</div>
      <div class="di-text">まず <strong>[最小アクション]</strong> から始めると即効性が高いです。</div>
    </div>

    <div class="data-insight" style="margin-top:6px;">
      <div class="di-icon">📎</div>
      <div class="di-text">スライドは <strong>[共有方法 / URL / Slack チャンネル]</strong> で共有します。</div>
    </div>
  </div>
</div>

---

<!-- _class: section-slide -->

<div class="sec-no">Q&A</div>

<hr>

## ご質問・ご意見をどうぞ
<span class="subtitle-en">Questions & Discussion</span>

<div class="section-desc">ご清聴ありがとうございました。</div>

<div style="margin-top:24px;display:flex;gap:10px;flex-wrap:wrap;">
  <span class="pill accent">[メール / Slack]</span>
  <span class="pill primary">[参考URL / リポジトリ]</span>
  <span class="pill warm">[次回イベント]</span>
</div>

---

<!--
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  APPENDIX — 使い方ガイド
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ■ 新規コンポーネント (Modern Edition)

  ┌─────────────────────────────────────────────────────────┐
  │  .stat-row / .stat-item(.highlight)                     │
  │  → 横並び数値ブロック。アジェンダや結論スライドに有効    │
  │                                                         │
  │  .data-insight(.success / .warn)                        │
  │  → 1行インサイト吹き出し。テーブル下・グラフ下に添える   │
  │                                                         │
  │  .progress-list / .progress-row                         │
  │  → プログレスバー。課題の影響度・達成率の表示に有効      │
  │                                                         │
  │  .timeline / .timeline-item                             │
  │  → 縦タイムライン。背景説明・スケジュール提示に有効      │
  │                                                         │
  │  .pill(.accent / .primary / .warm)                      │
  │  → ピルバッジ。タグ・キーワード強調に有効               │
  │                                                         │
  │  .highlight-box                                         │
  │  → シアンのインラインハイライトボックス                  │
  │                                                         │
  │  .kpi-card(.warm)                                       │
  │  → アンバーゴールド系KPIカード (新バリアント)            │
  └─────────────────────────────────────────────────────────┘

  ■ 既存コンポーネント（変更なし・引き続き使用可）
    .cards / .card(.before / .action / .after)
    .issue-block
    .vision-block / .vision-label / .vision-note
    .step-list / .step-item
    .kpi-cards / .kpi-card(.accent / .positive / .negative)
    .topic-cards / .topic-card
    .data-table / .badge(.over / .meet / .under)
    .chart-wrap / .chart-title / .callout / .two-charts
    .cols / .cols-half / .cols-right / .cols-wide
    .label(.issue / .vision / .topic / .tips)
    .check-list / .highlight-list
    .img-placeholder / .img-wrap

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-->