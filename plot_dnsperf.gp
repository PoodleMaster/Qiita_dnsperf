# plot_dnsperf.gp

set title "DNS Performance (dnsperf)"
set xlabel "Time (s)"
set ylabel "Queries per Second (qps)"
set xrange [0:60]       # x軸の範囲を 0 から 60 秒に設定
set yrange [0:1500]     # y軸の範囲を 0 から 1500 QPS に設定
set xtics 5             # x軸の目盛りの間隔を10に設定
set ytics 100           # y軸の目盛りの間隔を50に設定
set grid
set format y "%4.0f"    # 整数を4桁で表示
set encoding utf8
set terminal pdfcairo font "DejaVu Sans Mono,10"
set output 'dnsperf-dns_performance_qps.pdf'

# プロット要素
plot "dnsperf_result_simple.txt" using 1:2 with lines title "DNS QPS"

