#!/bin/sh
# Konfigurasi Node Reika (VLSM - GNS3)
echo "Configuring Node Reika..."
ip addr flush dev eth0
ip addr add 10.65.12.3/24 dev eth0
ip link set eth0 up
ip route add default via 10.65.12.1 dev eth0
echo "Reika IP configured: 10.65.12.3/24, Gateway: 10.65.12.1"
ip addr show dev eth0
