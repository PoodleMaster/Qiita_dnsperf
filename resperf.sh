#!/bin/bash

# DNS Server
dns_server="192.168.10.1"

# 現在の年月日時刻を取得
timestamp=$(date +"%Y%m%d_%H%M%S")

# resperfコマンド実施
taskset -c 0-3 resperf -s "$dns_server" -d dns_queries.txt -r 60 -m 1500 -P resperf_result.txt > resperf_result_dashbord.txt

# 生成データ整理
cat resperf_result.txt

# データ保存
cp resperf_result.txt "resperf_result_$timestamp.txt"
cp resperf_result_dashbord.txt "resperf_result_dashbord_$timestamp.txt"

# グラフ作成
gnuplot -p plot_resperf1.gp
gnuplot -p plot_resperf2.gp

cp resperf-dns_performance_qps.pdf "resperf-dns_performance_qps_$timestamp.pdf"
cp resperf-dns_performance_AverageLatency.pdf "resperf-dns_performance_AverageLatency_$timestamp.pdf"

