# dnsperfでの遊び方
**本ツールは、`dnsperf`、`resperf`、`gnuplot` を用いて、ログ取得とグラフ作成を自動化するツールです。**

実行環境は、`Ubuntu 22.04.5 LTS` です。

![image](https://github.com/user-attachments/assets/ce0a5bfd-1c45-4398-8346-60d2776b08d5)

## ■ Install
dnsperfを動作させるため各種インストールします。
```sh:Ubuntu
> sudo apt update
> sudo apt upgrade
> sudo apt install -y libssl-dev libldns-dev libck-dev libnghttp2-dev
> sudo apt install dnsperf
> sudo apt install gnuplot
```

## ■ Download
本ツール類をダウンロードして適当なフォルダに配置します。
```sh:Ubuntu
> git clone https://github.com/PoodleMaster/Qiita_dnsperf
```

## ■ Setting
本ツール類を実行可能状態にします。
```sh:Ubuntu
> chmod a+x dnsperf.sh
> chmod a+x resperf.sh
```

## ■ Exec
本ツール類を実行します。<BR>

※本ツール内から `dnsperf` や `resperf` を実行します。また `gnuplot` を用いて自動的にグラフ化します。

### ❖ dnsperfの実行
DNSクエリを1000qpsで負荷をかけていきます。
```sh:Ubuntu
> dnsperf.sh
```
<BR>

パラメータ等を変更する場合は、`dnsperf.sh` にある `dnsperfコマンド` のオプション等を変更してください。

本ツールでは、`dnsperfコマンド` を以下で実行しています。
```sh:dnsperf
dnsperf -s "$dns_server" -d dns_queries.txt -q 1000 -Q 1000 -S 1 -l 60
```

```txt:
-s "192.168.10.1" : DNSサーバの指定
-d dns_queries.txt : 送信するDNSクエリの指定
-q 1000 : 同時に送信できる未処理クエリの最大数を1000に設定
-Q 1000 : クエリ送信レートの上限を1000QPSに設定
-S 1 : 1秒あたりのクエリ数（QPS）統計を1秒ごとに出力
-l 60 : 実行時間の上限（60秒）
```
<BR>

取得データは、以下の3つです。
* dnsperf_result.txt
* dnsperf_result_simple.txt
* dnsperf-dns_performance_qps.pdf
<BR>
それぞれ実行した日時を付けてコピーされるので、何回実行してもログとして残るようになっています。

例）以下のようにコピーされます。
* dnsperf_result_20241121_101531.txt
* dnsperf_result_simple_20241121_101531.txt
* dnsperf-dns_performance_qps_20241121_101531.pdf
  
### ❖ resperfの実行
DNSクエリを1500qpsまで徐々に負荷をかけていきます。
```sh:Ubuntu
> resperf.sh
```
<BR>

パラメータ等を変更する場合は、 `resperf.sh` にある `resperfコマンド` のオプション等を変更してください。

本ツールでは、`resperfコマンド` を以下で実行しています。
```sh:resperf
resperf -s "$dns_server" -d dns_queries.txt -r 60 -m 1500 -P resperf_result.txt
```

```txt:
-s "192.168.10.1" : DNSサーバの指定
-d dns_queries.txt : 送信するDNSクエリの指定
-r 60 : ランプアップ時間（60秒）
-m 1500 : 1秒あたりの最大クエリ数（1500クエリ）
-P resperf_result.txt : プロットデータファイルの名前
```
<BR>

取得データは、以下の4つです。
* resperf_result.txt
* resperf_result_dashbord.txt
* resperf-dns_performance_AverageLatency.pdf
* resperf-dns_performance_qps.pdf
<BR>
それぞれ実行した日時を付けてコピーされるので、何回実行してもログとして残るようになっています。

例）以下のようにコピーされます。
* resperf_result_20241121_101729.txt
* resperf_result_dashbord_20241121_101729.txt
* resperf-dns_performance_AverageLatency_20241121_101729.pdf
* resperf-dns_performance_qps_20241121_101729.pdf

## ■ 実行結果（サンプル）

### ❖ dnsperf実行結果
![dns_performance](https://github.com/user-attachments/assets/f436a7af-e586-4c12-ac87-cb7d86901290)

### ❖ resperf実行結果
![dns_performance](https://github.com/user-attachments/assets/00796ac2-c3a6-44fc-9a15-b0071b9d82f1)
![dns_performance_AverageLatency](https://github.com/user-attachments/assets/a2b83c6e-d3ed-4b2c-b72c-49b25f2a1f68)
