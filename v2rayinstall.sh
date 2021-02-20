#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
mkdir /etc/v2ray
	echo "检查Docker......"
	docker -v
    if [ $? -eq  0 ]; then
        echo "检查到Docker已安装!"
    else
    	echo "安装docker环境..."
        curl -sSL https://get.daocloud.io/docker | sh
        systemctl start docker
        systemctl enable docker
        echo -e "安装docker环境...安装完成!"
    fi
clear
    echo -e "一键安装v2ray脚本howard 2021-2-21
————————————————————————————————
 ${Green_font_prefix}1.${Font_color_suffix} 安装 v2ray ssr ss
 ${Green_font_prefix}2.${Font_color_suffix} 卸载 v2ray ssr ss
 ${Green_font_prefix}3.${Font_color_suffix} 退出
————————————————————————————————"
read -t 30 -p "输入对应数字【1-3】 :" howard
if [ "${howard}" = "1" ]; then
	read -t 30 -p "要安装v2ray ？ y/n :" vtworay
	if [ "${vtworay}" = "y" ]; then
		rm -f /etc/v2ray/*
		wget -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_mkcp_detour.json 
		wget -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_tcp.json 
		wget -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_mkcp.json
		docker run -d --name v2ray_mkcp --restart=always -v /etc/v2ray:/etc/v2ray -p 52001:52001 -p 52001:52001/udp v2fly/v2fly-core  v2ray -config=/etc/v2ray/config_mkcp.json
		docker run -d --name v2ray_tcp --restart=always -v /etc/v2ray:/etc/v2ray -p 51001:51001 -p 51001:51001/udp v2fly/v2fly-core  v2ray -config=/etc/v2ray/config_tcp.json
	elif [ "${vtworay}" = "n" ]; then
		echo "---"
	fi
	echo "————————————————————————————————"
	read -t 30 -p "要安装ss和ssr ？ y/n :" ssrss
	if [ "${ssrss}" = "y" ]; then
		docker run -d -p 54019:8388 -p 54019:8388/udp --name shadowsocks-libev --restart=always -e SERVER_PORT="8388" -e PASSWORD="hxc123" -e METHOD="aes-128-gcm" -e DNS_ADDRS="8.8.8.8,223.5.5.5,8.8.4.4,114.114.114.114" -e TIMEOUT="3000" shadowsocks/shadowsocks-libev
		docker run -d -p 54009:8388 -p 54009:8388/udp --name shadowsocksR-libev --restart=always -e SERVER_PORT="8388" -e PASSWORD="hxc123" -e METHOD="aes-128-cfb" -e DNS_ADDRS="8.8.8.8,223.5.5.5,8.8.4.4,114.114.114.114" -e TIMEOUT="3000" shadowsocks/shadowsocks-libev
	elif [ "${ssrss}" = "n" ]; then
		echo "---"
	fi
	if [ "${vtworay}" = "y" ]; then
	echo -e "订阅后，修改ip即可使用
	————————————————————————————————
	vmess://ew0KICAidiI6ICIyIiwNCiAgInBzIjogInYycmF5IiwNCiAgImFkZCI6ICIwLjAuMC4wIiwNCiAgInBvcnQiOiAiNTIwMDEiLA0KICAiaWQiOiAiOWFjOWEwYjMtZTgwYi00NjZiLTgxM2EtNzM4YzZjZmQ0NmNkIiwNCiAgImFpZCI6ICIyMCIsDQogICJuZXQiOiAia2NwIiwNCiAgInR5cGUiOiAibm9uZSIsDQogICJob3N0IjogIiIsDQogICJwYXRoIjogIiIsDQogICJ0bHMiOiAiIg0KfQ==
	————————————————————————————————"
	fi
	if [ "${ssrss}" = "y" ]; then
	echo -e "订阅后，修改ip即可使用
	————————————————————————————————
	ss://YWVzLTEyOC1nY206aHhjMTIzQDAuMC4wLjA6NTQwMTk#ss

	ssr://MC4wLjAuMDo1NDAwOTpvcmlnaW46YWVzLTEyOC1jZmI6cGxhaW46YUhoak1USXovP3JlbWFya3M9YzNOeSZwcm90b3BhcmFtPSZvYmZzcGFyYW09
	————————————————————————————————"
	fi
echo -e "
————————————————————————————————
goodbye friends！！！
————————————————————————————————
docker正在运行的容器：
————————————————————————————————"
docker ps
elif [ "${howard}" = "3" ]; then
	read -t 30 -p "要卸载v2ray？ y/n :" vtworaydel
	if [ "${vtworaydel}" = "y" ]; then
		docker stop v2ray_mkcp v2ray_tcp 
		docker rm v2ray_mkcp v2ray_tcp 
		rm -f /etc/v2ray/*
		echo "已卸载v2ray"
	elif [ "${vtworaydel}" = "n" ]; then
		echo "---"
	fi
	echo "————————————————————————————————"
	read -t 30 -p "要卸载ssr和ss？ y/n :" ssrssdel
		if [ "${ssrssdel}" = "y" ]; then
		docker stop shadowsocks-libev shadowsocksR-libev
		docker rm shadowsocks-libev shadowsocksR-libev
		echo "已卸载ssr和ss"
	elif [ "${ssrssdel}" = "n" ]; then
		echo "---"
	fi
echo -e "
————————————————————————————————
goodbye friends！！！
————————————————————————————————
docker正在运行的容器：
————————————————————————————————"
docker ps
elif [ "${howard}" = "4" ]; then
clear
	    echo -e "
————————————————————————————————
goodbye friends！！！
————————————————————————————————
docker正在运行的容器：
————————————————————————————————"
docker ps
echo -e "————————————————————————————————"
fi

rm -- "$0"
