# plot_resperf1.gp

set title "DNS Performance (resperf)"
set xlabel "Time (s)"
set ylabel "Queries per Second (qps)"
set xrange [0:60]       # x軸の範囲を 0 から 60 秒に設定
set yrange [0:*]        # y軸の範囲を 0 から 最大値までに設定
set xtics 5             # x軸の目盛りの間隔を10に設定
set ytics 100           # y軸の目盛りの間隔を50に設定
set grid
set format y "%4.0f"    # 整数を4桁で表示
set encoding utf8
set terminal pdfcairo font "DejaVu Sans Mono,10"
set output 'resperf-dns_performance_qps.pdf'

# プロット要素
# target_qps		：ツールが送信することを目指している目標のクエリ数やレスポンス数。
# actual_qps		：ツールが実際に送信したクエリの結果。
# responses_per_sec	：スループットを示す指標。処理できたリクエストの数です。
# failures_per_sec	：発生した失敗（エラー）の数。

plot "resperf_result.txt" using 1:2 with lines linecolor "red" title "Target QPS", \
     "resperf_result.txt" using 1:3 with lines linecolor "blue" title "Actual QPS", \
     "resperf_result.txt" using 1:4 with lines linecolor "purple" title "Responses per sec", \
     "resperf_result.txt" using 1:5 with lines linecolor "green" title "Failures per sec"

