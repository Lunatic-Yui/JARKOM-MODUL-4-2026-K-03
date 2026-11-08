#!/bin/sh
# Konfigurasi Node Yasuo (VLSM - GNS3)
echo "Configuring Node Yasuo..."
ip addr flush dev eth0
ip addr add 10.65.13.2/24 dev eth0
ip link set eth0 up
ip route add default via 10.65.13.1 dev eth0
echo "Yasuo IP configured: 10.65.13.2/24, Gateway: 10.65.13.1"
ip addr show dev eth0
