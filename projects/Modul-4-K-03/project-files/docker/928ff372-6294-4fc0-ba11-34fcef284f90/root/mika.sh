#!/bin/sh
# Konfigurasi Node Mika (VLSM - GNS3)
echo "Configuring Node Mika..."
ip addr flush dev eth0
ip addr add 10.65.15.3/26 dev eth0
ip link set eth0 up
ip route add default via 10.65.15.1 dev eth0
echo "Mika IP configured: 10.65.15.3/26, Gateway: 10.65.15.1"
ip addr show dev eth0
