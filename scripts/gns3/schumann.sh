#!/bin/sh
# Konfigurasi Router Schumann (VLSM - GNS3)
# Interface:
# eth0: A3 (ke Switch2) -> 10.65.16.36/29
# eth1: A7 (ke Akashic) -> 10.65.16.41/29
# eth2: A8 (ke Accela) -> 10.65.16.61/30

echo "Configuring Router Schumann..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.65.16.36/29 dev eth0
ip link set eth0 up

ip addr add 10.65.16.41/29 dev eth1
ip link set eth1 up

ip addr add 10.65.16.61/30 dev eth2
ip link set eth2 up

# Route downstream ke Accela LAN (A9)
ip route add 10.65.4.0/22 via 10.65.16.62 dev eth2

# Direct neighbor routes di Switch2
ip route add 10.65.0.0/22 via 10.65.16.34 dev eth0
ip route add 10.65.8.0/23 via 10.65.16.35 dev eth0
ip route add 10.65.15.192/26 via 10.65.16.35 dev eth0

# Default gateway ke Wired
ip route add default via 10.65.16.33 dev eth0

echo "Schumann configured successfully!"
ip route
