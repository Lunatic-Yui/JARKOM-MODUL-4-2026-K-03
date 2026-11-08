#!/bin/sh
# Konfigurasi Router Copland (VLSM - GNS3)
# Interface:
# eth0: A3 (ke Switch2) -> 10.65.16.35/29
# eth1: A5 (ke Juri) -> 10.65.15.193/26
# eth2: A6 (ke Switch4 - Masayuki) -> 10.65.8.1/23

echo "Configuring Router Copland..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.65.16.35/29 dev eth0
ip link set eth0 up

ip addr add 10.65.15.193/26 dev eth1
ip link set eth1 up

ip addr add 10.65.8.1/23 dev eth2
ip link set eth2 up

# Direct neighbor routes di Switch2
ip route add 10.65.0.0/22 via 10.65.16.34 dev eth0
ip route add 10.65.4.0/22 via 10.65.16.36 dev eth0
ip route add 10.65.16.40/29 via 10.65.16.36 dev eth0
ip route add 10.65.16.60/30 via 10.65.16.36 dev eth0

# Default gateway ke Wired
ip route add default via 10.65.16.33 dev eth0

echo "Copland configured successfully!"
ip route
