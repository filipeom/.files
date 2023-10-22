sysctl net.ipv4.ip_forward=1

iptables -t nat -A POSTROUTING -o enp0s31f6 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i wlp0s20f3 -o enp0s31f6 -j ACCEPT
