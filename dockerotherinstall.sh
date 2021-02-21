#!/bin/bash
clear
    echo -e "一键安装应用软件howard v1.5
————————————————————————————————
 ${Green_font_prefix}1.${Font_color_suffix} 安装 htop系统进程监控
 ${Green_font_prefix}2.${Font_color_suffix} 安装 portainer，docker网页管理，9000端口
 ${Green_font_prefix}3.${Font_color_suffix} 安装 测速软件， 6688端口
 ${Green_font_prefix}4.${Font_color_suffix} 安装 qbittorrent，8080网页，52000传输端口
 ${Green_font_prefix}5.${Font_color_suffix} 进入卸载模式
 ${Green_font_prefix}6.${Font_color_suffix} 退出
————————————————————————————————"
read -t 30 -p "输入对应数字【1-6】 :" dockerin
if [ "${dockerin}" = "1" ]; then
yum -y install htop
elif [ "${dockerin}" = "2" ]; then
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /home/docker/portainer:/data --name portainer --restart=always portainer/portainer
elif [ "${dockerin}" = "3" ]; then
docker run -d -p 6688:80 ilemonrain/html5-speedtest:alpine --name speedtest --restart=always
elif [ "${dockerin}" = "4" ]; then
docker run -d -p 52000:52000 -p 52000:52000/udp -p 8080:8080 --name qbittorrent --restart=always -v /path/to/appdata/config:/config -v /path/to/downloads:/downloads -e WEBUI_PORT="8080" linuxserver/qbittorrent
elif [ "${dockerin}" = "5" ]; then
	clear
	    echo -e "一键安装应用软件howard v1.5
	————————————————————————————————
	 ${Green_font_prefix}1.${Font_color_suffix} 卸载 portainer
	 ${Green_font_prefix}2.${Font_color_suffix} 卸载 测速软件
	 ${Green_font_prefix}3.${Font_color_suffix} 卸载 qbittorrent
	 ${Green_font_prefix}4.${Font_color_suffix} 退出
	————————————————————————————————"
	read -t 30 -p "输入对应数字【1-4】 :" dockerdel
	if [ "${dockerdel}" = "1" ]; then
	docker stop speedtest
	docker rm speedtest
	echo "已卸载 speedtest"
	elif [ "${dockerdel}" = "2" ]; then
	docker stop portainer
	docker rm portainer
	echo "已卸载 portainer"
	elif [ "${dockerdel}" = "3" ]; then
	docker stop qbittorrent
	docker rm qbittorrent
	echo "已卸载 qbittorrent"
	fi
clear
	    echo -e "
————————————————————————————————
goodbye friends！！！
————————————————————————————————
docker正在运行的容器：
————————————————————————————————"
docker ps
echo -e "————————————————————————————————"
else
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
