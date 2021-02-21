awk '/port/' /etc/v2ray/config_tcp.json>/etc/v2ray/config_tcp_port.json
awk '{print $2}' /etc/v2ray/config_tcp_port.json>/etc/v2ray/config_tcp_port2.json
var=$(cat /etc/v2ray/config_tcp_port2.json)
echo ${var}
