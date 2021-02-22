# vtworay
###### 欢迎来到docker v2ray 一键安装脚本，vps首选centOS 7 64bit系统
###### 只需要复制下面代码到ssh，即可运行，1分钟内搭建完成，即可使用
###### 方便快捷！！！

## 一、一键docker脚本
```bash
wget  https://raw.githubusercontent.com/Howardnm/vtworay/main/v2rayinstall.sh && chmod +x v2rayinstall.sh && ./v2rayinstall.sh
```
## 二、订阅后，客户端修改ip即可使用
##### $$ 和 $$r
<img src="https://github.com/Howardnm/vtworay/raw/main/images/ss.jpg" width="10%">            <img src="https://github.com/Howardnm/vtworay/raw/main/images/ssr.jpg" width="15%">
##### vmmess
mkcp协议，如果vps网络不稳定，扫这个（推荐）
<img src="https://github.com/Howardnm/vtworay/raw/main/images/vmesstcp.jpg" width="20%">
tcp协议，vps网络质量好，扫这个
<img src="https://github.com/Howardnm/vtworay/raw/main/images/vmessmkcp.jpg" width="20%">

## 三、其他
##### 1、如果脚本运行失败，请先运行下面代码，再重新运行脚本
```bash
yum -y install wget
yum -y install curl
```
##### 2、安装bbr（可选）
bbr，建议在centos 7运行，看文字输入数字，步骤：1、安装bbrplus，2、优化配置，3、重启后启动bbrplus
```bash
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
```
##### 3、docker应用软件一键脚本（可选）
```bash
wget  https://raw.githubusercontent.com/Howardnm/vtworay/main/dockerotherinstall.sh && chmod +x dockerotherinstall.sh && ./dockerotherinstall.sh
```
