# docker v2ray
###### 欢迎来到docker v2ray 一键安装脚本
###### 只需要复制下面代码到ssh，即可运行，1分钟内搭建完成，即可使用
###### 方便快捷！！！
##### vps配置
```bash
1、系统：仅适用于centOS，推荐centOS 7 64bit
2、内存：推荐512MB，至少256MB
3、拥有ipv4
```
## 一、一键docker脚本
```bash
wget  https://raw.githubusercontent.com/Howardnm/vtworay/main/v2rayinstall.sh && chmod +x v2rayinstall.sh && ./v2rayinstall.sh
```
## 二、完成脚本后，就可以订阅了，订阅后，客户端修改ip即可使用
##### clash直接订阅
```bash
https://raw.githubusercontent.com/Howardnm/docker-vtworay/main/clash%E8%AE%A2%E9%98%85v2ray.yaml
```
##### 想扫码请访问：
https://github.com/Howardnm/docker-vtworay/blob/main/images/vr%20code.md
## 三、其他
##### 1、如果脚本运行失败，请先运行下面代码，再重新运行脚本
```bash
yum -y install wget
yum -y install curl
```
##### 2、安装bbr（可选）
bbr，建议在centos 7运行，看文字输入数字，步骤：1、安装bbr魔改版，2、优化配置，3、重启后启动bbr魔改版
```bash
wget -N --no-check-certificate "https://raw.githubusercontent.com/Howardnm/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
```
##### 3、docker应用软件一键脚本（可选）
```bash
wget  https://raw.githubusercontent.com/Howardnm/vtworay/main/dockerotherinstall.sh && chmod +x dockerotherinstall.sh && ./dockerotherinstall.sh
```
