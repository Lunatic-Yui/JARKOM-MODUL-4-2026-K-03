#!/bin/sh
# Konfigurasi Node Taro (VLSM - GNS3)
echo "Configuring Node Taro..."
ip addr flush dev eth0
ip addr add 10.65.15.66/26 dev eth0
ip link set eth0 up
ip route add default via 10.65.15.65 dev eth0
echo "Taro IP configured: 10.65.15.66/26, Gateway: 10.65.15.65"
ip addr show dev eth0
