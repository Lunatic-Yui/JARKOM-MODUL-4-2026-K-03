#!/bin/sh
# Konfigurasi Node Karl (VLSM - GNS3)
echo "Configuring Node Karl..."
ip addr flush dev eth0
ip addr add 10.65.0.2/22 dev eth0
ip link set eth0 up
ip route add default via 10.65.0.1 dev eth0
echo "Karl IP configured: 10.65.0.2/22, Gateway: 10.65.0.1"
ip addr show dev eth0
