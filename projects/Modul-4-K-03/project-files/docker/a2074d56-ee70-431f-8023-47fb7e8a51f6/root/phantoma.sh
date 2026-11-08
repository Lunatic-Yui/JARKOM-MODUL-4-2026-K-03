#!/bin/sh
# Konfigurasi Router Phantoma (VLSM - GNS3)
# Interface:
# eth0: A22 (ke Knights) -> 10.65.16.86/30
# eth1: A23 (ke Switch12 - Semi) -> 10.65.16.1/27
# eth2: A24 (ke Shibuya) -> 10.65.16.89/30

echo "Configuring Router Phantoma..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.65.16.86/30 dev eth0
ip link set eth0 up

ip addr add 10.65.16.1/27 dev eth1
ip link set eth1 up

ip addr add 10.65.16.89/30 dev eth2
ip link set eth2 up

# Routing downstream ke Shibuya
ip route add 10.65.15.0/26 via 10.65.16.90 dev eth2

# Default gateway ke Knights
ip route add default via 10.65.16.85 dev eth0

echo "Phantoma configured successfully!"
ip route
