#!/bin/sh
# Konfigurasi Router Navi (VLSM - GNS3)
# Interface:
# eth0: A10 (ke Wired) -> 10.65.16.66/30
# eth1: A11 (ke Switch6 - Alice, Reika) -> 10.65.12.1/24
# eth2: A12 (ke Switch7 - Taro) -> 10.65.15.65/26
# eth3: A13 (ke Switch8 - Yasuo, Miho, Kuma) -> 10.65.13.1/24

echo "Configuring Router Navi..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3

ip addr add 10.65.16.66/30 dev eth0
ip link set eth0 up

ip addr add 10.65.12.1/24 dev eth1
ip link set eth1 up

ip addr add 10.65.15.65/26 dev eth2
ip link set eth2 up

ip addr add 10.65.13.1/24 dev eth3
ip link set eth3 up

# Default gateway ke Wired
ip route add default via 10.65.16.65 dev eth0

echo "Navi configured successfully!"
ip route
