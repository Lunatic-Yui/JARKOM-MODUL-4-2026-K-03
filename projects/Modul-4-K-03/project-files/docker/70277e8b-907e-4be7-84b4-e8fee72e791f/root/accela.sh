#!/bin/sh
# Konfigurasi Router Accela (VLSM - GNS3)
# Interface:
# eth0: A8 (ke Schumann) -> 10.65.16.62/30
# eth1: A9 (ke Switch5 - Omnipresence, Denpa) -> 10.65.4.1/22

echo "Configuring Router Accela..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1

ip addr add 10.65.16.62/30 dev eth0
ip link set eth0 up

ip addr add 10.65.4.1/22 dev eth1
ip link set eth1 up

# Default gateway ke Schumann
ip route add default via 10.65.16.61 dev eth0

echo "Accela configured successfully!"
ip route
