# plot_resperf2.gp

set title "DNS Performance (resperf)"
set xlabel "Time (s)"
set ylabel "Average Latency (ms)"
set xrange [0:60]       # x軸の範囲を 0 から 60 秒に設定
set yrange [0:*]        # y軸の範囲を 0 から最大値まで設定
set xtics 5             # x軸の目盛りの間隔を5に設定
set ytics 0.1           # y軸の目盛りの間隔を0.1ミリ秒に設定
set grid
set format y " %1.1f"   # 4桁で表示
set encoding utf8
set terminal pdfcairo font "DejaVu Sans Mono,10"
set output 'resperf-dns_performance_AverageLatency.pdf'

# プロット要素
plot "resperf_result.txt" using 1:6 with lines linecolor "blue" title "Average Latency"

