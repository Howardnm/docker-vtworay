#!/bin/bash

basepath=$(cd `dirname $0`; pwd)
mkdir /etc/v2ray
cd /etc/v2ray
rm -f *
	echo "检查Docker......"
	docker -v
    if [ $? -eq  0 ]; then
        echo "检查到Docker已安装!"
    else
    	echo "安装docker环境..."
        curl -sSL https://get.daocloud.io/docker | sh
        systemctl start docker
        systemctl enable docker
        echo "安装docker环境...安装完成!"
    fi
read -t 30 -p "输入：1、安装 2、卸载 3、退出 :" howard
if [ "${howard}" = "1" ]; then
	read -t 30 -p "是否安装v2ray? y or n :" vtworay
	if [ "${vtworay}" = "y" ]; then
		wget -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_mkcp_detour.json 
		wget -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_tcp.json 
		wget -P /etc/v2ray/ https://raw.githubusercontent.com/Howardnm/vtworay/main/config_mkcp.json
		docker run -d --name v2ray_mkcp --restart=always -v /etc/v2ray:/etc/v2ray -p 52001:52001 -p 52001:52001/udp v2fly/v2fly-core  v2ray -config=/etc/v2ray/config_mkcp.json
		docker run -d --name v2ray_tcp --restart=always -v /etc/v2ray:/etc/v2ray -p 51001:51001 -p 51001:51001/udp v2fly/v2fly-core  v2ray -config=/etc/v2ray/config_tcp.json
	elif [ "${vtworay}" = "n" ]; then
		echo "---"
	fi
	read -t 30 -p "是否安装ss和ssr? y or n :" ssrss
	if [ "${ssrss}" = "y" ]; then
		docker run -d -p 54019:8388 -p 54019:8388/udp --name shadowsocks-libev --restart=always -e SERVER_PORT="8388" -e PASSWORD="hxc123" -e METHOD="aes-128-gcm" -e DNS_ADDRS="8.8.8.8,223.5.5.5,8.8.4.4,114.114.114.114" -e TIMEOUT="3000" shadowsocks/shadowsocks-libev
		docker run -d -p 54009:8388 -p 54009:8388/udp --name shadowsocksR-libev --restart=always -e SERVER_PORT="8388" -e PASSWORD="hxc123" -e METHOD="aes-128-cfb" -e DNS_ADDRS="8.8.8.8,223.5.5.5,8.8.4.4,114.114.114.114" -e TIMEOUT="3000" shadowsocks/shadowsocks-libev
	elif [ "${ssrss}" = "n" ]; then
		echo "---"
	fi
	if [ "${vtworay}" = "y" ]; then
		echo "订阅后，修改ip即可使用"
		echo "vmess://ew0KICAidiI6ICIyIiwNCiAgInBzIjogInYycmF5IiwNCiAgImFkZCI6ICIwLjAuMC4wIiwNCiAgInBvcnQiOiAiNTIwMDEiLA0KICAiaWQiOiAiOWFjOWEwYjMtZTgwYi00NjZiLTgxM2EtNzM4YzZjZmQ0NmNkIiwNCiAgImFpZCI6ICIyMCIsDQogICJuZXQiOiAia2NwIiwNCiAgInR5cGUiOiAibm9uZSIsDQogICJob3N0IjogIiIsDQogICJwYXRoIjogIiIsDQogICJ0bHMiOiAiIg0KfQ=="
	fi
	if [ "${ssrss}" = "y" ]; then
		echo "订阅后，修改ip即可使用"
		echo "ss://YWVzLTEyOC1nY206aHhjMTIzQDAuMC4wLjA6NTQwMTk#ss"
		echo "ssr://MC4wLjAuMDo1NDAwOTpvcmlnaW46YWVzLTEyOC1jZmI6cGxhaW46YUhoak1USXovP3JlbWFya3M9YzNOeSZwcm90b3BhcmFtPSZvYmZzcGFyYW09"
	fi
elif [ "${howard}" = "2" ]; then
	read -t 30 -p "是否卸载v2ray? y or n :" vtworaydel
	if [ "${vtworaydel}" = "y" ]; then
		docker stop v2ray_mkcp v2ray_tcp 
		docker rm v2ray_mkcp v2ray_tcp 
		rm -f /etc/v2ray/*
		echo "已卸载v2ray"
	elif [ "${vtworaydel}" = "n" ]; then
		echo "---"
	read -t 30 -p "是否卸载ssr和ss? y or n :" ssrssdel
		if [ "${ssrssdel}" = "y" ]; then
		docker stop shadowsocks-libev
		docker rm shadowsocksR-libev
		echo "已卸载ssr和ss"
	elif [ "${ssrssdel}" = "n" ]; then
		echo "---"
elif [ "${howard}" = "3" ]; then
	echo "goodbye！"
fi
cd
