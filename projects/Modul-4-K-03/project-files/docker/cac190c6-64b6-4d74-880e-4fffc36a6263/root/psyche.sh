#!/bin/sh
# Konfigurasi Router Psyche (VLSM - GNS3)
# Interface:
# eth0: A3 (ke Switch2) -> 10.65.16.34/29
# eth1: A4 (ke Switch3 - Karl, Lin) -> 10.65.0.1/22

echo "Configuring Router Psyche..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1

ip addr add 10.65.16.34/29 dev eth0
ip link set eth0 up

ip addr add 10.65.0.1/22 dev eth1
ip link set eth1 up

# Direct neighbor routes di Switch2
ip route add 10.65.8.0/23 via 10.65.16.35 dev eth0
ip route add 10.65.15.192/26 via 10.65.16.35 dev eth0
ip route add 10.65.4.0/22 via 10.65.16.36 dev eth0
ip route add 10.65.16.40/29 via 10.65.16.36 dev eth0
ip route add 10.65.16.60/30 via 10.65.16.36 dev eth0

# Default gateway ke Wired
ip route add default via 10.65.16.33 dev eth0

echo "Psyche configured successfully!"
ip route
