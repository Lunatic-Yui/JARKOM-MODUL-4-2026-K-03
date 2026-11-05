#!/bin/sh
# Konfigurasi Router Shibuya (VLSM - GNS3)
# Interface:
# eth0: A24 (ke Phantoma) -> 10.65.16.90/30
# eth1: A25 (ke Switch13 - Lain, Mika) -> 10.65.15.1/26

echo "Configuring Router Shibuya..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1

ip addr add 10.65.16.90/30 dev eth0
ip link set eth0 up

ip addr add 10.65.15.1/26 dev eth1
ip link set eth1 up

# Default gateway ke Phantoma
ip route add default via 10.65.16.89 dev eth0

echo "Shibuya configured successfully!"
ip route
