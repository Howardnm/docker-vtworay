url="https://raw.githubusercontent.com/Howardnm/vtworay/main/config_mkcp.json"
echo ${url#https://}
awk '/port/' /etc/v2ray/config_tcp.json>/etc/v2ray/config_tcp1.json
awk '{print $2}' /etc/v2ray/config_tcp1.json>/etc/v2ray/config_tcp2.json
var=$(cat somefile.txt)
echo ${var}
