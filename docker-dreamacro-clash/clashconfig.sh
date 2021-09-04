#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
mkdir /root/clashconfig
rm -f /root/clashconfig/*
rm -f /volume1/docker/clash/config.yaml
clear
read -t 60 -p "clash订阅地址：" url1
echo ${url1} >> /root/clashconfig/url1.txt
awk -F/ '{print $(NF)}' /root/clashconfig/url1.txt >> /root/clashconfig/url2.txt
url2=$(cat /root/clashconfig/url2.txt)
wget -P /root/clashconfig/ ${url1}
mv /root/clashconfig/${url2} /root/clashconfig/config1.txt


sed -e '1,7d' /root/clashconfig/config1.txt>/root/clashconfig/config2.txt
sed -e '1 c port: 7890\nsocks-port: 7891\nallow-lan: true\nmode: global\nlog-level: info\nexternal-controller: 0.0.0.0:9090\nauthentication:\n - "howard:DoP9cbf1nl"' /root/clashconfig/config2.txt>/volume1/docker/clash/config.yaml

rm -f /root/clashconfig/*

docker restart dreamacro-clash1
echo '脚本已结束！！'
rm -- "$0"
