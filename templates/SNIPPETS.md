---
marp: true
theme: default
paginate: true
---

<!-- Chart.js CDN（base-slide.md のフロントマター直下に1度だけ記載） -->
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@4/dist/chart.umd.min.js"></script> -->

<!--
=========================================================
  SNIPPETS.md — グラフ・KPI・画像 スニペット集
=========================================================
  このファイルはコピペ用サンプルです。
  base-slide.md に必要な部分だけ貼り付けて使ってください。

  ━━ 前提 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ・theme: default（build.sh / base-slide.md のフロントマターで設定済み）
  ・themes/charts.css が build.sh で自動読み込み済み
  ・--html オプションが build.sh に含まれている（Chart.js 動作に必須）

  ━━ Chart.js のPDF出力について ━━━━━━━━━━━━━━━━━━━━━
  ・HTML出力: インタラクティブに動作
  ・PDF出力: Puppeteer がスクリプト実行後にスクリーンショット
    → build.sh に --wait 800 を設定済み（グラフ描画待ち）
    → グラフが空になる場合は PDF_WAIT_MS の値を増やしてください
=========================================================
-->

<!-- スライド区切り -->

<!-- =====================================================
     SNIPPET 01: KPIカード（4列）
     ===================================================== -->

<header><span>目標と実績の概要</span><span class="header-en">Performance Summary</span></header>

## 上半期の主要KPI

<div class="kpi-cards">
  <div class="kpi-card">
    <div class="kpi-label">提案資料 作成数</div>
    <div class="kpi-value">13<span class="kpi-unit">件</span></div>
    <div class="kpi-delta up">目標比 130%</div>
  </div>
  <div class="kpi-card accent">
    <div class="kpi-label">セミナー開催数</div>
    <div class="kpi-value">6<span class="kpi-unit">回</span></div>
    <div class="kpi-delta up">目標比 100%</div>
  </div>
  <div class="kpi-card positive">
    <div class="kpi-label">営業支援レポート</div>
    <div class="kpi-value">14<span class="kpi-unit">本</span></div>
    <div class="kpi-delta up">目標比 117%</div>
  </div>
  <div class="kpi-card positive">
    <div class="kpi-label">テンプレDL数</div>
    <div class="kpi-value">132<span class="kpi-unit">回</span></div>
    <div class="kpi-delta up">目標比 132%</div>
  </div>
</div>

<!-- スライド区切り -->

<!-- =====================================================
     SNIPPET 02: データテーブル（達成率バッジ付き）
     ===================================================== -->

<header><span>目標と実績の概要</span><span class="header-en">Performance Summary</span></header>

## KPI達成状況

<table class="data-table">
  <thead>
    <tr>
      <th>KPI項目</th>
      <th class="num">目標値</th>
      <th class="num">実績値</th>
      <th class="num">達成率</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>提案資料の作成・納品数</td>
      <td class="num">10件</td>
      <td class="num">13件</td>
      <td class="num"><span class="badge over">130%</span></td>
    </tr>
    <tr>
      <td>セミナー開催数（社内向け）</td>
      <td class="num">6回</td>
      <td class="num">6回</td>
      <td class="num"><span class="badge meet">100%</span></td>
    </tr>
    <tr>
      <td>営業支援レポート（週次発行）</td>
      <td class="num">12本</td>
      <td class="num">14本</td>
      <td class="num"><span class="badge over">117%</span></td>
    </tr>
    <tr>
      <td>資料テンプレDL数（部内共有）</td>
      <td class="num">100回</td>
      <td class="num">132回</td>
      <td class="num"><span class="badge over">132%</span></td>
    </tr>
  </tbody>
</table>

<!-- スライド区切り -->

<!-- =====================================================
     SNIPPET 03: 棒グラフ（Chart.js）
     ===================================================== -->

<header><span>目標と実績の概要</span><span class="header-en">Performance Summary</span></header>

## KPI達成率グラフ

<div class="callout">戦略的な実行で、全体KPIをクリア</div>

<div class="chart-wrap" style="height:280px">
<canvas id="kpiBar"></canvas>
</div>

<script>
(function() {
  // Chart.js がロードされるまで待機
  function initChart() {
    if (typeof Chart === 'undefined') { setTimeout(initChart, 100); return; }
    const primary = getComputedStyle(document.documentElement)
      .getPropertyValue('--color-primary').trim() || '#1e2d6e';
    const accent = getComputedStyle(document.documentElement)
      .getPropertyValue('--color-accent').trim() || '#2ab4b4';
    new Chart(document.getElementById('kpiBar'), {
      type: 'bar',
      data: {
        labels: ['提案資料作成', 'セミナー開催数', '営業支援レポート', 'テンプレDL数'],
        datasets: [{
          label: '達成率 (%)',
          data: [130, 100, 117, 132],
          backgroundColor: [primary, accent, primary + 'cc', accent + 'cc'],
          borderRadius: 3,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: {
          legend: { display: false },
          datalabels: { display: false }
        },
        scales: {
          y: {
            min: 0, max: 150,
            ticks: { callback: v => v + '%', font: { size: 11 } },
            grid: { color: '#e0e4ee' }
          },
          x: { ticks: { font: { size: 11 } }, grid: { display: false } }
        }
      }
    });
  }
  initChart();
})();
</script>

<!-- スライド区切り -->

<!-- =====================================================
     SNIPPET 04: 折れ線グラフ（月次推移）
     ===================================================== -->

<header><span>セミナー運営の強化</span><span class="header-en">Enhancing Internal Seminars</span></header>

## セミナー参加率の推移

<div class="two-charts">
  <div class="chart-col">
    <div class="chart-title">参加率の推移（月次）</div>
    <div class="callout">4月テーマ「業務効率の見直し」が参加率TOP</div>
    <div class="chart-wrap" style="height:220px">
    <canvas id="seminarLine"></canvas>
    </div>
  </div>
  <div class="chart-col">
    <div class="chart-title">満足度スコア</div>
    <div class="chart-wrap" style="height:220px">
    <canvas id="satisfactionDoughnut"></canvas>
    </div>
  </div>
</div>

<script>
(function() {
  function initCharts() {
    if (typeof Chart === 'undefined') { setTimeout(initCharts, 100); return; }
    const primary = getComputedStyle(document.documentElement)
      .getPropertyValue('--color-primary').trim() || '#1e2d6e';
    const accent = getComputedStyle(document.documentElement)
      .getPropertyValue('--color-accent').trim() || '#2ab4b4';

    // 折れ線グラフ
    new Chart(document.getElementById('seminarLine'), {
      type: 'bar',
      data: {
        labels: ['1月', '2月', '3月', '4月', '5月', '6月'],
        datasets: [{
          type: 'bar',
          label: '参加率',
          data: [76, 79, 83, 88, 84, 82],
          backgroundColor: ['#b0bcd6','#b0bcd6','#7485aa','#1e2d6e','#7485aa','#b0bcd6'],
          borderRadius: 2,
          yAxisID: 'y',
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: { min: 0, max: 100, ticks: { callback: v => v + '%', font: { size: 10 } }, grid: { color: '#e0e4ee' } },
          x: { ticks: { font: { size: 10 } }, grid: { display: false } }
        }
      }
    });

    // ドーナツグラフ
    new Chart(document.getElementById('satisfactionDoughnut'), {
      type: 'doughnut',
      data: {
        labels: ['非常に満足', '満足', '普通', 'やや不満'],
        datasets: [{
          data: [56, 34, 8, 2],
          backgroundColor: [accent, accent + '88', '#b0c0d8', '#e0bebe'],
          borderWidth: 0,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        cutout: '65%',
        plugins: {
          legend: { position: 'bottom', labels: { font: { size: 10 }, padding: 8 } }
        }
      }
    });
  }
  initCharts();
})();
</script>

<!-- スライド区切り -->

<!-- =====================================================
     SNIPPET 05: レーダーチャート
     ===================================================== -->

<header><span>レポート活用状況</span><span class="header-en">Enhancing Sales Support Reports</span></header>

## レポート活用状況とKPI別使用傾向

<div class="two-charts">
  <div class="chart-col">
    <div class="chart-title">引用件数の推移（週次）</div>
    <div class="chart-wrap" style="height:230px">
    <canvas id="citationLine"></canvas>
    </div>
  </div>
  <div class="chart-col">
    <div class="chart-title">KPI別使用率</div>
    <div class="callout accent">商談件数・成約率がレポートの中核KPIとして定着</div>
    <div class="chart-wrap" style="height:200px">
    <canvas id="kpiRadar"></canvas>
    </div>
  </div>
</div>

<script>
(function() {
  function initCharts() {
    if (typeof Chart === 'undefined') { setTimeout(initCharts, 100); return; }
    const primary = getComputedStyle(document.documentElement)
      .getPropertyValue('--color-primary').trim() || '#1e2d6e';
    const accent = getComputedStyle(document.documentElement)
      .getPropertyValue('--color-accent').trim() || '#2ab4b4';

    // 折れ線
    new Chart(document.getElementById('citationLine'), {
      type: 'line',
      data: {
        labels: ['第1週','第2週','第3週','第4週','第5週','第6週','第7週','第8週'],
        datasets: [{
          data: [8, 11, 10, 13, 15, 12, 16, 19],
          borderColor: primary,
          backgroundColor: primary + '18',
          borderWidth: 2,
          pointRadius: 4,
          pointBackgroundColor: primary,
          fill: true,
          tension: 0.3,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: { min: 0, ticks: { font: { size: 10 } }, grid: { color: '#e0e4ee' } },
          x: { ticks: { font: { size: 9 } }, grid: { display: false } }
        }
      }
    });

    // レーダー
    new Chart(document.getElementById('kpiRadar'), {
      type: 'radar',
      data: {
        labels: ['商談件数', '成約率', '顧客属性別分析', 'アクション実行数', '競合との比較'],
        datasets: [{
          data: [90, 85, 60, 70, 50],
          backgroundColor: accent + '30',
          borderColor: accent,
          borderWidth: 2,
          pointBackgroundColor: accent,
          pointRadius: 3,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          r: {
            min: 0, max: 100,
            ticks: { display: false },
            grid: { color: '#d6dce8' },
            pointLabels: { font: { size: 9 } }
          }
        }
      }
    });
  }
  initCharts();
})();
</script>

<!-- スライド区切り -->

<!-- =====================================================
     SNIPPET 06: 画像＋テキスト（2カラム）
     fetch-image.sh で取得した画像、または手動配置
     ===================================================== -->

<header><span>ビジュアルスライド例</span><span class="header-en">Visual Layout</span></header>

## 画像＋テキストレイアウト

<!--
  レイアウトバリアント:
    .cols       → テキスト多め（左57% / 右43%）デフォルト
    .cols-half  → 均等2列（50% / 50%）
    .cols-right → 画像メイン（左40% / 右60%）
    .cols-wide  → 本文広め（左65% / 右35%）
-->

<!-- パターンA: テキスト多め（デフォルト） -->
<div class="cols">
  <div>

  - ポイント① 説明文をここに書く
  - ポイント② 説明文をここに書く
  - ポイント③ 説明文をここに書く

  </div>
  <div>

  <!-- 画像取得: bash scripts/fetch-image.sh "business meeting" 1 hero -->
  <!-- 取得後コメントを外す: -->
  <!-- ![説明](assets/images/hero.jpg) -->
  <div class="img-placeholder">
    📷 ここに画像を配置<br>
    <small>fetch-image.sh で取得 → パスをコメントアウト解除</small>
  </div>

  </div>
</div>

<!-- パターンB: 画像メイン（.cols-right） -->
<!--
<div class="cols-right">
  <div>
  - ポイント① 説明文
  </div>
  <div>
  ![説明](assets/images/hero.jpg)
  </div>
</div>
-->

<!-- パターンC: 均等2列（.cols-half） -->
<!--
<div class="cols-half">
  <div>
  左カラムの内容
  </div>
  <div>
  右カラムの内容
  </div>
</div>
-->

<!-- スライド区切り -->

<!-- =====================================================
     SNIPPET 07: 背景画像スライド
     （Marp の backgroundImage ディレクティブ使用）
     ===================================================== -->

<!-- _backgroundImage: url(assets/images/hero.jpg) -->
<!-- _backgroundOpacity: 0.15 -->

<header><span>ビジュアルスライド例</span><span class="header-en">Hero Slide</span></header>

## 背景画像スライド

背景に画像を薄く敷くレイアウトです。

`_backgroundOpacity` の値（0.0〜1.0）で透過度を調整できます。

<div class="guide">
使い方:<br>
1. <code>bash scripts/fetch-image.sh "キーワード" hero.jpg</code><br>
2. スライドの先頭コメントで指定:<br>
<code>&lt;!-- _backgroundImage: url(assets/images/hero.jpg) --&gt;</code><br>
<code>&lt;!-- _backgroundOpacity: 0.15 --&gt;</code>
</div>

<!-- スライド区切り -->

<!-- =====================================================
     SNIPPET 08: 円グラフ（パイ）+ KPIカード組み合わせ
     ===================================================== -->

<header><span>実績サマリー</span><span class="header-en">Performance Highlights</span></header>

## 構成比と数値サマリー

<div class="cols">
  <div>
    <div class="kpi-cards cols-2">
      <div class="kpi-card">
        <div class="kpi-label">平均満足度</div>
        <div class="kpi-value">4.6<span class="kpi-unit">/5.0</span></div>
        <div class="kpi-sub">全6回セミナー平均</div>
      </div>
      <div class="kpi-card accent">
        <div class="kpi-label">参加率平均</div>
        <div class="kpi-value">82<span class="kpi-unit">%</span></div>
        <div class="kpi-delta up">前年比 +12%</div>
      </div>
    </div>
  </div>
  <div>
    <div class="chart-title">満足度の内訳</div>
    <div class="chart-wrap" style="height:200px">
    <canvas id="pieSatisfaction"></canvas>
    </div>
  </div>
</div>

<script>
(function() {
  function initChart() {
    if (typeof Chart === 'undefined') { setTimeout(initChart, 100); return; }
    const accent = getComputedStyle(document.documentElement)
      .getPropertyValue('--color-accent').trim() || '#2ab4b4';
    new Chart(document.getElementById('pieSatisfaction'), {
      type: 'pie',
      data: {
        labels: ['非常に満足 56%', '満足 34%', '普通 8%', 'やや不満 2%'],
        datasets: [{
          data: [56, 34, 8, 2],
          backgroundColor: [accent, accent + 'aa', '#b0c4d8', '#ddb8b8'],
          borderWidth: 0,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { position: 'right', labels: { font: { size: 10 }, padding: 8 } } }
      }
    });
  }
  initChart();
})();
</script>

<!-- =====================================================
     Chart.js CDN読み込み（スライドのどこか1箇所に記載）
     base-slide.md のフロントマターの下に追加推奨
     ===================================================== -->

<!--
使い方メモ:
  Marpの --html オプションが有効な場合（build.sh はデフォルトで有効）、
  以下のスクリプトタグをMarkdownの末尾か、グラフスライドの直前に1度だけ記載してください。
  Chart.js が自動的にロードされます。

  <script src="https://cdn.jsdelivr.net/npm/chart.js@4/dist/chart.umd.min.js"></script>

  注意: HTMLエクスポート（.html）ではインタラクティブに動作します。
       PDFエクスポートでは Puppeteer がスクリプトを実行してから
       スクリーンショットを撮るため、グラフも静的画像として出力されます。
       （ただしPDF出力時は描画タイミングにより空になる場合があります。
         その場合は --wait オプションを build.sh に追加してください）
-->