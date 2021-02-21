#!/bin/bash
	read -t 30 -p "要卸载v2ray？ y/n :" vtworaydel
	if [ "${vtworaydel}" = "y" ]; then
		docker stop v2ray_mkcp v2ray_tcp 
		docker rm v2ray_mkcp v2ray_tcp 
		rm -f /etc/v2ray/*
		echo "已卸载v2ray"
	elif [ "${vtworaydel}" = "n" ]; then
		echo "---"
	fi
rm -- "$0"
