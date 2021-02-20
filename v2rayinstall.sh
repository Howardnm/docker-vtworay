#!/bin/bash

basepath=$(cd `dirname $0`; pwd)

read -t 30 -p "是否安装v2ray? y or n :" isMove
if [ "${isMove}" = "y" ]; then
curl -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_mkcp_detour.json 
curl -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_tcp.json 
curl -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_mkcp.json
docker run -d --name v2ray_mkcp --restart=always -v /etc/v2ray:/etc/v2ray -p 52001:52001 -p 52001:52001/udp v2fly/v2fly-core  v2ray -config=/etc/v2ray/config_mkcp.json
docker run -d --name v2ray_tcp --restart=always -v /etc/v2ray:/etc/v2ray -p 51001:51001 -p 51001:51001/udp v2fly/v2fly-core  v2ray -config=/etc/v2ray/config_tcp.json
elif [ "${isMove}" = "n" ]; then
echo "已退出 !"
