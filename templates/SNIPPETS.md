---
marp: true
theme: default
paginate: true
---

<script src="https://cdn.jsdelivr.net/npm/chart.js@4/dist/chart.umd.min.js"></script>

<!--
╔══════════════════════════════════════════════════════════════════════╗
║  SNIPPETS.md — グラフ・KPI・データ可視化 スニペット集                ║
║  ARK GRAPHICS Modern Edition  base.css + charts.css 対応            ║
╚══════════════════════════════════════════════════════════════════════╝

━━ 前提 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ・theme: default（gaia は使わない）
  ・themes/base.css + charts.css が build.sh で自動読み込み済み
  ・--html オプション必須（Chart.js 動作に必要）

━━ 収録スニペット ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  SNIPPET 01  KPIカード 4列（callout + stat-row 付き）
  SNIPPET 02  データテーブル（達成率バッジ + data-insight）
  SNIPPET 03  棒グラフ（グラデーション色 + 目標ライン）
  SNIPPET 04  折れ線 + ドーナツ 2カラム
  SNIPPET 05  折れ線（エリア塗り） + レーダーチャート
  SNIPPET 06  画像 + テキスト 2カラム（バリアント付き）
  SNIPPET 07  背景画像スライド
  SNIPPET 08  パイチャート + KPIカード
  SNIPPET 09  ★NEW プログレスバー + stat-row ダッシュボード
  SNIPPET 10  ★NEW 横棒グラフ（ランキング）
  SNIPPET 11  ★NEW 複合グラフ（棒 + 折れ線）
  SNIPPET 12  ★NEW data-insight + timeline まとめスライド

━━ Chart.js カラーパレット（Modern Edition 準拠） ━━━━━━━━━
  CSS変数から取得するため project.css のカラー変更に自動追従。
  フォールバック値も Modern Edition の色で統一済み。

  const cs     = getComputedStyle(document.documentElement);
  const C      = k => cs.getPropertyValue(k).trim();
  const primary   = C('--color-primary')     || '#0f1f5c';
  const accent    = C('--color-accent')      || '#06b6d4';
  const warm      = C('--color-accent-warm') || '#f59e0b';
  const success   = C('--color-tips')        || '#10b981';
  const danger    = C('--color-issue')       || '#ef4444';
  const muted     = C('--color-muted')       || '#7c87a0';
  const border    = C('--color-border')      || '#dde3ef';

━━ PDF出力 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Puppeteer がスクリプト実行後にスクリーンショット。
  グラフが空になる場合は build.sh の --wait を増やしてください。
  推奨: PDF_WAIT_MS=1200
-->

---

<!-- =====================================================
     SNIPPET 01: KPIカード（4列）+ callout + stat-row
     callout で注目数値を強調 → KPI → stat-row でサブ数値
     ===================================================== -->

<header><span>目標と実績の概要</span><span class="header-en">Performance Summary</span></header>

## 上半期の主要KPI

<div class="callout-wrap">
  <span class="callout accent">📊 全4指標で目標を達成 — 平均達成率 120%</span>
</div>

<div class="kpi-cards">
  <div class="kpi-card positive">
    <div class="kpi-label">提案資料 作成数</div>
    <div class="kpi-value">13<span class="kpi-unit">件</span></div>
    <div class="kpi-delta up">目標比 130%</div>
    <div class="kpi-sub">目標 10件</div>
  </div>
  <div class="kpi-card accent">
    <div class="kpi-label">セミナー開催数</div>
    <div class="kpi-value">6<span class="kpi-unit">回</span></div>
    <div class="kpi-delta up">目標比 100%</div>
    <div class="kpi-sub">目標通り完遂</div>
  </div>
  <div class="kpi-card positive">
    <div class="kpi-label">営業支援レポート</div>
    <div class="kpi-value">14<span class="kpi-unit">本</span></div>
    <div class="kpi-delta up">目標比 117%</div>
    <div class="kpi-sub">目標 12本</div>
  </div>
  <div class="kpi-card warm">
    <div class="kpi-label">テンプレDL数</div>
    <div class="kpi-value">132<span class="kpi-unit">回</span></div>
    <div class="kpi-delta up">目標比 132%</div>
    <div class="kpi-sub">目標 100回</div>
  </div>
</div>

<div class="stat-row">
  <div class="stat-item highlight">
    <div class="stat-num">120<span style="font-size:.45em;font-weight:400;color:var(--color-muted)">%</span></div>
    <div class="stat-label">平均達成率</div>
  </div>
  <div class="stat-item">
    <div class="stat-num">4<span style="font-size:.5em;font-weight:400;color:var(--color-muted)">/4</span></div>
    <div class="stat-label">目標達成項目</div>
  </div>
  <div class="stat-item">
    <div class="stat-num">+32</div>
    <div class="stat-label">テンプレDL 超過数</div>
  </div>
  <div class="stat-item">
    <div class="stat-num">2<span style="font-size:.5em;font-weight:400;color:var(--color-muted)">本</span></div>
    <div class="stat-label">レポート超過分</div>
  </div>
</div>

---

<!-- =====================================================
     SNIPPET 02: データテーブル + data-insight
     badges: .over(緑) / .meet(シアン) / .under(赤)
     ===================================================== -->

<header><span>目標と実績の概要</span><span class="header-en">Performance Summary</span></header>

## KPI達成状況

<div class="chart-title">上半期 KPI達成率一覧</div>

<table class="data-table">
  <thead>
    <tr>
      <th>KPI項目</th>
      <th class="num">目標値</th>
      <th class="num">実績値</th>
      <th class="num">達成率</th>
      <th>ステータス</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>提案資料の作成・納品数</td>
      <td class="num">10件</td>
      <td class="num">13件</td>
      <td class="num"><span class="badge over">130%</span></td>
      <td><span class="pill accent">超過達成</span></td>
    </tr>
    <tr>
      <td>セミナー開催数（社内向け）</td>
      <td class="num">6回</td>
      <td class="num">6回</td>
      <td class="num"><span class="badge meet">100%</span></td>
      <td><span class="pill primary">目標通り</span></td>
    </tr>
    <tr>
      <td>営業支援レポート（週次発行）</td>
      <td class="num">12本</td>
      <td class="num">14本</td>
      <td class="num"><span class="badge over">117%</span></td>
      <td><span class="pill accent">超過達成</span></td>
    </tr>
    <tr>
      <td>資料テンプレDL数（部内共有）</td>
      <td class="num">100回</td>
      <td class="num">132回</td>
      <td class="num"><span class="badge over">132%</span></td>
      <td><span class="pill accent">超過達成</span></td>
    </tr>
  </tbody>
</table>

<div class="data-insight success" style="margin-top:10px;">
  <div class="di-icon">✅</div>
  <div class="di-text">全4指標で目標達成。特に<strong>テンプレDL数（132%）・提案資料作成（130%）</strong>が牽引。</div>
</div>

---

<!-- =====================================================
     SNIPPET 03: 棒グラフ（目標ライン + グラデーション色）
     Modern Edition カラーパレット使用
     ===================================================== -->

<header><span>目標と実績の概要</span><span class="header-en">Performance Summary</span></header>

## KPI達成率グラフ

<div class="callout-wrap">
  <span class="callout accent">📈 戦略的な実行で、全体KPIをクリア</span>
  <span class="callout">目標ライン: 100%</span>
</div>

<div class="chart-wrap" style="height:300px">
  <canvas id="kpiBar"></canvas>
</div>

<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const cs = getComputedStyle(document.documentElement);
    const C = k => cs.getPropertyValue(k).trim();
    const primary = C('--color-primary') || '#0f1f5c';
    const accent  = C('--color-accent')  || '#06b6d4';
    const warm    = C('--color-accent-warm') || '#f59e0b';
    const success = C('--color-tips')    || '#10b981';
    const border  = C('--color-border')  || '#dde3ef';

    new Chart(document.getElementById('kpiBar'), {
      type: 'bar',
      data: {
        labels: ['提案資料作成', 'セミナー開催数', '営業支援レポート', 'テンプレDL数'],
        datasets: [
          {
            label: '目標',
            data: [100, 100, 100, 100],
            backgroundColor: 'rgba(15,31,92,0.08)',
            borderColor: primary,
            borderWidth: 1.5,
            borderRadius: 5,
            type: 'bar',
          },
          {
            label: '達成率 (%)',
            data: [130, 100, 117, 132],
            backgroundColor: [success, accent, accent, warm],
            borderRadius: 5,
            borderSkipped: false,
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: true,
            position: 'bottom',
            labels: { font: { size: 11 }, boxWidth: 12, padding: 16 }
          },
          tooltip: {
            callbacks: { label: ctx => ` ${ctx.dataset.label}: ${ctx.parsed.y}%` }
          }
        },
        scales: {
          y: {
            min: 0, max: 150,
            ticks: { callback: v => v + '%', font: { size: 11 } },
            grid: { color: 'rgba(200,210,230,0.5)' }
          },
          x: { ticks: { font: { size: 11 } }, grid: { display: false } }
        }
      }
    });
  }
  init();
})();
</script>

---

<!-- =====================================================
     SNIPPET 04: 棒グラフ（月次） + ドーナツ（2カラム）
     two-charts レイアウト使用
     ===================================================== -->

<header><span>セミナー運営の強化</span><span class="header-en">Enhancing Internal Seminars</span></header>

## セミナー参加率の推移

<div class="two-charts">
  <div class="chart-col">
    <div class="chart-title">参加率の推移（月次）</div>
    <div class="callout-wrap">
      <span class="callout">4月「業務効率の見直し」が参加率TOP</span>
    </div>
    <div class="chart-wrap" style="height:230px">
      <canvas id="seminarBar"></canvas>
    </div>
  </div>
  <div class="chart-col">
    <div class="chart-title">満足度スコア内訳</div>
    <div class="chart-wrap" style="height:230px">
      <canvas id="satisfactionDoughnut"></canvas>
    </div>
    <div class="data-insight success" style="margin-top:8px; font-size:0.9em;">
      <div class="di-icon">⭐</div>
      <div class="di-text">非常に満足 + 満足 合計 <strong>90%</strong></div>
    </div>
  </div>
</div>

<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const cs = getComputedStyle(document.documentElement);
    const C = k => cs.getPropertyValue(k).trim();
    const primary = C('--color-primary') || '#0f1f5c';
    const accent  = C('--color-accent')  || '#06b6d4';
    const warm    = C('--color-accent-warm') || '#f59e0b';
    const muted   = C('--color-muted')   || '#7c87a0';

    /* 棒グラフ: ハイライト月だけ primary, 他はグレー系 */
    new Chart(document.getElementById('seminarBar'), {
      type: 'bar',
      data: {
        labels: ['1月', '2月', '3月', '4月', '5月', '6月'],
        datasets: [{
          label: '参加率 (%)',
          data: [76, 79, 83, 88, 84, 82],
          backgroundColor: [
            muted + '66', muted + '66',
            accent + '99', primary,
            accent + '99', muted + '66'
          ],
          borderRadius: 5,
          borderSkipped: false,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: {
            min: 60, max: 100,
            ticks: { callback: v => v + '%', font: { size: 10 } },
            grid: { color: 'rgba(200,210,230,0.5)' }
          },
          x: { ticks: { font: { size: 10 } }, grid: { display: false } }
        }
      }
    });

    /* ドーナツ */
    new Chart(document.getElementById('satisfactionDoughnut'), {
      type: 'doughnut',
      data: {
        labels: ['非常に満足', '満足', '普通', 'やや不満'],
        datasets: [{
          data: [56, 34, 8, 2],
          backgroundColor: [primary, accent, muted + '66', '#ef4444' + '66'],
          borderWidth: 0,
          hoverOffset: 8,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        cutout: '68%',
        plugins: {
          legend: {
            position: 'bottom',
            labels: { font: { size: 10 }, padding: 10, boxWidth: 10 }
          }
        }
      }
    });
  }
  init();
})();
</script>

---

<!-- =====================================================
     SNIPPET 05: 折れ線（エリア塗り）+ レーダー（2カラム）
     ===================================================== -->

<header><span>レポート活用状況</span><span class="header-en">Sales Support Reports</span></header>

## レポート活用状況とKPI別使用傾向

<div class="two-charts">
  <div class="chart-col">
    <div class="chart-title">引用件数の推移（週次）</div>
    <div class="chart-wrap" style="height:240px">
      <canvas id="citationLine"></canvas>
    </div>
    <div class="data-insight" style="margin-top:8px; font-size:0.9em;">
      <div class="di-icon">📈</div>
      <div class="di-text">第5週以降：フィードバック導入後に<strong>引用数が加速</strong></div>
    </div>
  </div>
  <div class="chart-col">
    <div class="chart-title">KPI別使用率</div>
    <div class="callout-wrap">
      <span class="callout accent">商談件数・成約率が中核KPIとして定着</span>
    </div>
    <div class="chart-wrap" style="height:210px">
      <canvas id="kpiRadar"></canvas>
    </div>
  </div>
</div>

<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const cs = getComputedStyle(document.documentElement);
    const C = k => cs.getPropertyValue(k).trim();
    const primary = C('--color-primary') || '#0f1f5c';
    const accent  = C('--color-accent')  || '#06b6d4';
    const warm    = C('--color-accent-warm') || '#f59e0b';

    /* 折れ線（エリア塗り） */
    new Chart(document.getElementById('citationLine'), {
      type: 'line',
      data: {
        labels: ['第1週','第2週','第3週','第4週','第5週','第6週','第7週','第8週'],
        datasets: [{
          data: [8, 11, 10, 13, 15, 12, 16, 19],
          borderColor: accent,
          backgroundColor: accent + '22',
          borderWidth: 2.5,
          pointRadius: 5,
          pointBackgroundColor: '#fff',
          pointBorderColor: accent,
          pointBorderWidth: 2.5,
          fill: true,
          tension: 0.4,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: {
            min: 0,
            ticks: { font: { size: 10 } },
            grid: { color: 'rgba(200,210,230,0.5)' }
          },
          x: { ticks: { font: { size: 9 } }, grid: { display: false } }
        }
      }
    });

    /* レーダー */
    new Chart(document.getElementById('kpiRadar'), {
      type: 'radar',
      data: {
        labels: ['商談件数', '成約率', '顧客属性分析', 'アクション実行数', '競合比較'],
        datasets: [{
          data: [90, 85, 60, 70, 50],
          backgroundColor: primary + '22',
          borderColor: primary,
          borderWidth: 2,
          pointBackgroundColor: primary,
          pointRadius: 4,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          r: {
            min: 0, max: 100,
            ticks: { display: false },
            grid: { color: 'rgba(200,210,230,0.6)' },
            pointLabels: { font: { size: 9.5 }, color: '#1a1f36' }
          }
        }
      }
    });
  }
  init();
})();
</script>

---

<!-- =====================================================
     SNIPPET 06: 画像 + テキスト（2カラム・バリアント付き）
     ===================================================== -->

<header><span>ビジュアルスライド例</span><span class="header-en">Visual Layout</span></header>

## 画像＋テキストレイアウト

<!--
  ┌──────────────────────────────────────────────────┐
  │  レイアウトバリアント                              │
  │  .cols       左57% / 右43%  テキスト多め（既定）  │
  │  .cols-half  50% / 50%  均等2列                  │
  │  .cols-right 左40% / 右60% 画像メイン             │
  │  .cols-wide  左65% / 右35% 本文広め               │
  └──────────────────────────────────────────────────┘
-->

<!-- パターンA: テキスト多め（デフォルト） -->
<div class="cols">
  <div>

  <span class="label topic">TOPIC</span>

  - ポイント① 説明文をここに書く
  - ポイント② 説明文をここに書く
  - ポイント③ 説明文をここに書く

  <div class="data-insight" style="margin-top:12px;">
    <div class="di-icon">💡</div>
    <div class="di-text">画像に関連する<strong>インサイトコメント</strong>をここに追加できます。</div>
  </div>

  </div>
  <div>

  <!-- fetch-image.sh で画像取得後、下のコメントを外す -->
  <!-- ![説明](assets/images/hero.jpg) -->
  <div class="img-wrap" style="height:260px;">
    <div class="img-placeholder" style="min-height:260px;">
      📷 ここに画像を配置<br>
      <small>bash scripts/fetch-image.sh "business" 1 hero</small>
    </div>
  </div>

  </div>
</div>

<!--
  パターンB: 画像メイン（.cols-right）
  <div class="cols-right">
    <div>テキスト</div>
    <div><img src="assets/images/hero.jpg" /></div>
  </div>

  パターンC: 均等2列（.cols-half）
  <div class="cols-half">
    <div>左</div>
    <div>右</div>
  </div>

  パターンD: 本文広め（.cols-wide）
  <div class="cols-wide">
    <div>左（広い）</div>
    <div>右（狭い）</div>
  </div>
-->

---

<!-- =====================================================
     SNIPPET 07: 背景画像スライド
     ===================================================== -->

<!-- _backgroundImage: url(assets/images/hero.jpg) -->
<!-- _backgroundOpacity: 0.12 -->

<header><span>ビジュアルスライド例</span><span class="header-en">Hero Slide</span></header>

## 背景画像スライド

背景に画像を薄く敷くレイアウトです。

<div style="display:flex;gap:8px;margin-bottom:12px;">
  <span class="pill accent">写真背景 対応</span>
  <span class="pill primary">透過度調整可</span>
</div>

- `_backgroundOpacity: 0.08〜0.18` が視認性と雰囲気のバランスが良い
- テキストが読みにくい場合はカードや `highlight-box` を活用する

<div class="guide">
使い方:<br>
① <code>bash scripts/fetch-image.sh "キーワード" 1 hero</code><br>
② スライド先頭に追加:<br>
<code>&lt;!-- _backgroundImage: url(assets/images/hero.jpg) --&gt;</code><br>
<code>&lt;!-- _backgroundOpacity: 0.12 --&gt;</code>
</div>

---

<!-- =====================================================
     SNIPPET 08: パイチャート + KPIカード（2カラム）
     ===================================================== -->

<header><span>実績サマリー</span><span class="header-en">Performance Highlights</span></header>

## 構成比と数値サマリー

<div class="cols-half">
  <div>
    <div class="kpi-cards cols-2" style="margin-top:0; gap:10px;">
      <div class="kpi-card positive">
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

    <div class="progress-list" style="margin-top:14px;">
      <div class="progress-row">
        <div class="pr-label">非常に満足</div>
        <div class="pr-bar-wrap"><div class="pr-bar" style="width:56%"></div></div>
        <div class="pr-val">56%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">満足</div>
        <div class="pr-bar-wrap"><div class="pr-bar primary" style="width:34%"></div></div>
        <div class="pr-val">34%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">普通</div>
        <div class="pr-bar-wrap"><div class="pr-bar" style="width:8%;background:var(--color-muted);box-shadow:none;"></div></div>
        <div class="pr-val">8%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">やや不満</div>
        <div class="pr-bar-wrap"><div class="pr-bar" style="width:2%;background:#ef4444;box-shadow:none;"></div></div>
        <div class="pr-val">2%</div>
      </div>
    </div>
  </div>
  <div>
    <div class="chart-title">満足度の内訳（パイ）</div>
    <div class="chart-wrap" style="height:260px">
      <canvas id="pieSatisfaction"></canvas>
    </div>
  </div>
</div>

<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const cs = getComputedStyle(document.documentElement);
    const C = k => cs.getPropertyValue(k).trim();
    const primary = C('--color-primary') || '#0f1f5c';
    const accent  = C('--color-accent')  || '#06b6d4';
    const muted   = C('--color-muted')   || '#7c87a0';

    new Chart(document.getElementById('pieSatisfaction'), {
      type: 'pie',
      data: {
        labels: ['非常に満足 56%', '満足 34%', '普通 8%', 'やや不満 2%'],
        datasets: [{
          data: [56, 34, 8, 2],
          backgroundColor: [primary, accent, muted + '88', '#ef4444' + '88'],
          borderWidth: 0,
          hoverOffset: 10,
        }]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom',
            labels: { font: { size: 10 }, padding: 10, boxWidth: 12 }
          }
        }
      }
    });
  }
  init();
})();
</script>

---

<!-- =====================================================
     SNIPPET 09: ★NEW プログレスバー + stat-row
     数値ダッシュボード型スライド
     ===================================================== -->

<header><span>施策別 達成状況</span><span class="header-en">Initiative Progress</span></header>

## 施策別 進捗ダッシュボード

<div class="cols-half">
  <div>
    <div class="chart-title">施策別 達成率</div>
    <div class="progress-list" style="margin-top:8px;">
      <div class="progress-row">
        <div class="pr-label">提案資料作成</div>
        <div class="pr-bar-wrap"><div class="pr-bar success" style="width:100%"></div></div>
        <div class="pr-val">130%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">セミナー開催</div>
        <div class="pr-bar-wrap"><div class="pr-bar primary" style="width:66.7%"></div></div>
        <div class="pr-val">100%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">支援レポート</div>
        <div class="pr-bar-wrap"><div class="pr-bar" style="width:78%"></div></div>
        <div class="pr-val">117%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">テンプレDL</div>
        <div class="pr-bar-wrap"><div class="pr-bar success" style="width:88%"></div></div>
        <div class="pr-val">132%</div>
      </div>
      <div class="progress-row">
        <div class="pr-label">[カスタム施策]</div>
        <div class="pr-bar-wrap"><div class="pr-bar" style="width:55%;background:#ef4444;box-shadow:0 0 6px rgba(239,68,68,0.3);"></div></div>
        <div class="pr-val" style="color:#dc2626;">55%</div>
      </div>
    </div>
  </div>
  <div>
    <div class="chart-title">サマリー数値</div>
    <div class="stat-row" style="margin-top:8px;">
      <div class="stat-item highlight">
        <div class="stat-num">4<span style="font-size:.5em;font-weight:400;color:var(--color-muted)">/5</span></div>
        <div class="stat-label">達成済み</div>
      </div>
      <div class="stat-item">
        <div class="stat-num">1</div>
        <div class="stat-label">要対応</div>
      </div>
    </div>

    <div class="data-insight success" style="margin-top:10px;">
      <div class="di-icon">✅</div>
      <div class="di-text"><strong>提案資料・テンプレDL</strong>が特に好調。チーム全体の底上げに貢献。</div>
    </div>
    <div class="data-insight warn" style="margin-top:6px;">
      <div class="di-icon">⚠️</div>
      <div class="di-text"><strong>[カスタム施策]</strong>が目標の55%。Q3でリソースを集中投下する。</div>
    </div>
    <div class="guide" style="margin-top:10px;">
      プログレスバーは <code>.pr-bar</code> の <code>width</code> を達成率に合わせて設定。<br>
      色: 既定=シアン / .primary=ネイビー / .success=グリーン / inline style でカスタム可
    </div>
  </div>
</div>

---

<!-- =====================================================
     SNIPPET 10: ★NEW 横棒グラフ（ランキング型）
     比較・順位を見せるのに最適
     ===================================================== -->

<header><span>部門別 実績比較</span><span class="header-en">Department Ranking</span></header>

## 部門別 提案資料作成数ランキング

<div class="cols">
  <div>
    <div class="callout-wrap">
      <span class="callout accent">🏆 マーケティング部が全部門トップ</span>
    </div>
    <div class="chart-wrap" style="height:300px; margin-top:10px;">
      <canvas id="deptRanking"></canvas>
    </div>
  </div>
  <div>
    <div class="kpi-cards cols-2" style="margin-top:0; gap:10px;">
      <div class="kpi-card positive">
        <div class="kpi-label">1位 部門</div>
        <div class="kpi-value" style="font-size:1.3em;">マーケ</div>
        <div class="kpi-sub">13件 / 目標比130%</div>
      </div>
      <div class="kpi-card accent">
        <div class="kpi-label">全部門平均</div>
        <div class="kpi-value">9.4<span class="kpi-unit">件</span></div>
        <div class="kpi-delta up">前期比 +18%</div>
      </div>
    </div>

    <div class="data-insight" style="margin-top:12px;">
      <div class="di-icon">📊</div>
      <div class="di-text">上位3部門が全体の<strong>68%</strong>を占める。集中サポートが有効。</div>
    </div>
    <div class="data-insight warn" style="margin-top:6px;">
      <div class="di-icon">⚠️</div>
      <div class="di-text"><strong>開発部・管理部</strong>は目標未達。資料テンプレを優先展開する。</div>
    </div>
  </div>
</div>

<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const cs = getComputedStyle(document.documentElement);
    const C = k => cs.getPropertyValue(k).trim();
    const primary = C('--color-primary') || '#0f1f5c';
    const accent  = C('--color-accent')  || '#06b6d4';
    const warm    = C('--color-accent-warm') || '#f59e0b';
    const success = C('--color-tips')    || '#10b981';
    const muted   = C('--color-muted')   || '#7c87a0';

    new Chart(document.getElementById('deptRanking'), {
      type: 'bar',
      data: {
        labels: ['マーケティング', '営業推進', '商品企画', '事業開発', '開発', '管理'],
        datasets: [{
          label: '作成件数',
          data: [13, 11, 10, 9, 7, 5],
          backgroundColor: [primary, accent, accent + 'cc', warm, muted + '99', muted + '66'],
          borderRadius: 4,
          borderSkipped: false,
        }]
      },
      options: {
        indexAxis: 'y',
        responsive: true, maintainAspectRatio: false,
        plugins: {
          legend: { display: false },
          tooltip: { callbacks: { label: ctx => ` ${ctx.parsed.x} 件` } }
        },
        scales: {
          x: {
            min: 0, max: 15,
            ticks: { font: { size: 10 }, callback: v => v + '件' },
            grid: { color: 'rgba(200,210,230,0.5)' }
          },
          y: { ticks: { font: { size: 10.5 } }, grid: { display: false } }
        }
      }
    });
  }
  init();
})();
</script>

---

<!-- =====================================================
     SNIPPET 11: ★NEW 複合グラフ（棒 + 折れ線）
     数量と比率を同一グラフに重ねる
     ===================================================== -->

<header><span>月次トレンド分析</span><span class="header-en">Monthly Trend</span></header>

## 月次 件数推移と達成率の複合グラフ

<div class="callout-wrap">
  <span class="callout accent">📈 6月は件数・達成率ともに過去最高を更新</span>
</div>

<div class="chart-wrap" style="height:300px; margin-top:10px;">
  <canvas id="compositeChart"></canvas>
</div>

<div class="stat-row" style="margin-top:12px;">
  <div class="stat-item highlight">
    <div class="stat-num">6月</div>
    <div class="stat-label">最高達成月</div>
  </div>
  <div class="stat-item">
    <div class="stat-num">128<span style="font-size:.5em;font-weight:400;color:var(--color-muted)">%</span></div>
    <div class="stat-label">6月達成率</div>
  </div>
  <div class="stat-item">
    <div class="stat-num">+34%</div>
    <div class="stat-label">1月比 件数増加率</div>
  </div>
  <div class="stat-item">
    <div class="stat-num">4.1</div>
    <div class="stat-label">上半期平均 件/週</div>
  </div>
</div>

<script>
(function() {
  function init() {
    if (typeof Chart === 'undefined') { setTimeout(init, 100); return; }
    const cs = getComputedStyle(document.documentElement);
    const C = k => cs.getPropertyValue(k).trim();
    const primary = C('--color-primary') || '#0f1f5c';
    const accent  = C('--color-accent')  || '#06b6d4';
    const warm    = C('--color-accent-warm') || '#f59e0b';

    new Chart(document.getElementById('compositeChart'), {
      data: {
        labels: ['1月', '2月', '3月', '4月', '5月', '6月'],
        datasets: [
          {
            type: 'bar',
            label: '作成件数',
            data: [8, 9, 11, 13, 12, 14],
            backgroundColor: primary + 'cc',
            borderRadius: 4,
            yAxisID: 'y',
          },
          {
            type: 'line',
            label: '達成率 (%)',
            data: [80, 90, 110, 130, 120, 128],
            borderColor: accent,
            backgroundColor: accent + '15',
            borderWidth: 2.5,
            pointRadius: 5,
            pointBackgroundColor: '#fff',
            pointBorderColor: accent,
            pointBorderWidth: 2.5,
            fill: true,
            tension: 0.4,
            yAxisID: 'y2',
          }
        ]
      },
      options: {
        responsive: true, maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom',
            labels: { font: { size: 11 }, boxWidth: 12, padding: 14 }
          }
        },
        scales: {
          y: {
            position: 'left',
            min: 0, max: 18,
            ticks: { font: { size: 10 }, callback: v => v + '件' },
            grid: { color: 'rgba(200,210,230,0.5)' }
          },
          y2: {
            position: 'right',
            min: 0, max: 160,
            ticks: { font: { size: 10 }, callback: v => v + '%' },
            grid: { display: false }
          },
          x: { ticks: { font: { size: 10.5 } }, grid: { display: false } }
        }
      }
    });
  }
  init();
})();
</script>

---

<!-- =====================================================
     SNIPPET 12: ★NEW data-insight + timeline まとめ型
     課題整理・振り返り・展望スライドに最適
     ===================================================== -->

<header><span>振り返りと展望</span><span class="header-en">Review & Outlook</span></header>

## 上半期の振り返りと下半期への展望

<div class="cols">
  <div>
    <span class="label vision">VISION</span>

    <div style="margin-top:10px; margin-bottom:8px; font-size:0.78em; font-weight:700; color:var(--color-muted); letter-spacing:0.08em; text-transform:uppercase;">✅ うまくいったこと</div>
    <div class="data-insight success">
      <div class="di-icon">🏆</div>
      <div class="di-text"><strong>テンプレDL数 132%達成</strong> — 全社展開の足がかりに</div>
    </div>
    <div class="data-insight success" style="margin-top:4px;">
      <div class="di-icon">📈</div>
      <div class="di-text"><strong>セミナー満足度 4.6/5.0</strong> — 参加率も月平均82%で安定</div>
    </div>

    <div style="margin-top:12px; margin-bottom:8px; font-size:0.78em; font-weight:700; color:var(--color-muted); letter-spacing:0.08em; text-transform:uppercase;">⚠️ 改善が必要なこと</div>
    <div class="data-insight warn">
      <div class="di-icon">🔧</div>
      <div class="di-text"><strong>レポートの閲覧率</strong> — 配信数は増加したが、実際の活用率が低い部門がある</div>
    </div>
    <div class="data-insight warn" style="margin-top:4px;">
      <div class="di-icon">⏱</div>
      <div class="di-text"><strong>フィードバックの収集速度</strong> — アンケート回答率を上げる施策が必要</div>
    </div>
  </div>
  <div>
    <div style="font-size:0.78em; font-weight:700; color:var(--color-muted); letter-spacing:0.08em; text-transform:uppercase; margin-bottom:6px;">📅 下半期 スケジュール</div>
    <div class="timeline">
      <div class="timeline-item">
        <div class="tl-date">7月</div>
        <div class="tl-content">レポート活用率の計測基盤を構築。BI連携を開始。</div>
      </div>
      <div class="timeline-item">
        <div class="tl-date">8〜9月</div>
        <div class="tl-content">活用率の低い部門へ個別フォロー。ワークショップを計2回実施。</div>
      </div>
      <div class="timeline-item">
        <div class="tl-date">10〜11月</div>
        <div class="tl-content"><strong>テンプレDL 200回 / セミナー参加率 90%以上</strong> を目標に設定。</div>
      </div>
      <div class="timeline-item">
        <div class="tl-date">12月</div>
        <div class="tl-content">年間総括レポート発行。全社報告と下期施策の評価を完了。</div>
      </div>
    </div>

    <div class="vision-block" style="margin-top:14px; font-size:0.85em;">
      下半期は「活用の深化」にフォーカス
    </div>
  </div>
</div>

---

<!--
╔══════════════════════════════════════════════════════════════════════╗
║  Chart.js カラーパレット 完全リファレンス                            ║
║  コピペしてそのまま使えるカラー設定                                  ║
╚══════════════════════════════════════════════════════════════════════╝

━━ 標準カラー取得ブロック（各 <script> の先頭に貼る）━━━━━━━━━━━━

    const cs      = getComputedStyle(document.documentElement);
    const C       = k => cs.getPropertyValue(k).trim();
    const primary = C('--color-primary')     || '#0f1f5c';  // ネイビー
    const accent  = C('--color-accent')      || '#06b6d4';  // シアン
    const warm    = C('--color-accent-warm') || '#f59e0b';  // アンバー
    const success = C('--color-tips')        || '#10b981';  // グリーン
    const danger  = C('--color-issue')       || '#ef4444';  // レッド
    const muted   = C('--color-muted')       || '#7c87a0';  // グレー
    const border  = C('--color-border')      || '#dde3ef';  // ライン

━━ 透明度バリアント（16進2桁サフィックス）━━━━━━━━━━━━━━━━━━━

    primary + '22'  → 13% 不透明（エリア塗り、薄い背景）
    primary + '66'  → 40% 不透明（補助バー、薄めの強調）
    primary + 'cc'  → 80% 不透明（やや透けた棒グラフ）
    accent  + '22'  → 13% 不透明
    accent  + '99'  → 60% 不透明

━━ グラフ種別ごとの推奨色 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    棒グラフ（単色）      → backgroundColor: accent または primary
    棒グラフ（複数系列）  → [primary, accent, warm, success]
    棒グラフ（達成率）    → 超過=success, 達成=accent, 未達=danger
    棒グラフ（ハイライト）→ ターゲット月=primary, 他=muted+'66'
    折れ線               → borderColor: accent, backgroundColor: accent+'22'
    ドーナツ・パイ        → [primary, accent, muted+'88', danger+'66']
    レーダー             → borderColor: primary, backgroundColor: primary+'22'
    横棒（ランキング）    → [primary, accent, accent+'cc', warm, muted+'99', muted+'66']

━━ グリッド・軸の共通設定 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    grid: { color: 'rgba(200,210,230,0.5)' }   // 縦横グリッド線
    ticks: { font: { size: 10 } }               // 軸ラベル
    ※ X軸グリッドは通常 display: false で非表示

━━ 共通 options 設定 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    responsive: true, maintainAspectRatio: false,
    borderRadius: 5, borderSkipped: false,        // 角丸棒グラフ
    tension: 0.4,                                 // 折れ線の滑らかさ
    cutout: '68%',                                // ドーナツの穴サイズ
    hoverOffset: 8,                               // パイ/ドーナツのhover

━━ コンテナ高さの目安 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    単独グラフ（フル幅）          height: 280〜320px
    2カラム内グラフ               height: 210〜240px
    KPIカード下の補助グラフ       height: 180〜200px
    two-charts 内グラフ           height: 220〜240px
-->