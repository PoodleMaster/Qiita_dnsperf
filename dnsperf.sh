#!/bin/bash

# DNS Server
dns_server="192.168.10.1"

# 現在の年月日時刻を取得
timestamp=$(date +"%Y%m%d_%H%M%S")

# dnsperfコマンド実施
taskset -c 0-3 dnsperf -s "$dns_server" -d dns_queries.txt -q 1000 -Q 1000 -S 1 -l 60 > dnsperf_result.txt

# 生成データ整理
awk '/^[0-9]/ { if (base == 0) base = $1; print ($1 - base), $2 }' dnsperf_result.txt > dnsperf_result_simple.txt
cat dnsperf_result_simple.txt

# データ保存
cp dnsperf_result.txt "dnsperf_result_$timestamp.txt"
cp dnsperf_result_simple.txt "dnsperf_result_simple_$timestamp.txt"

# グラフ作成
gnuplot -p plot_dnsperf.gp

cp dnsperf-dns_performance_qps.pdf "dnsperf-dns_performance_qps_$timestamp.pdf"

