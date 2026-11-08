#!/bin/sh
# Konfigurasi Router Cyberia (VLSM - GNS3)
# Interface:
# eth0: NAT1 (DHCP / Internet)
# eth1: A1 (LAN JJ, MyuMyu) -> 10.65.14.1/25
# eth2: A2 (Link ke Wired) -> 10.65.16.57/30

echo "Configuring Router Cyberia..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.65.14.1/25 dev eth1
ip link set eth1 up

ip addr add 10.65.16.57/30 dev eth2
ip link set eth2 up

# DHCP client pada eth0 (menghubungkan ke NAT1)
udhcpc -i eth0

# Routing ke seluruh jaringan internal Wired
ip route add 10.65.0.0/19 via 10.65.16.58 dev eth2

# NAT Masquerade agar client bisa akses internet
iptables -t nat -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo "Cyberia configured successfully!"
ip route
