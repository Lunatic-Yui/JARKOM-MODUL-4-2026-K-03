#!/bin/sh
# Konfigurasi Node Lin (VLSM - GNS3)
echo "Configuring Node Lin..."
ip addr flush dev eth0
ip addr add 10.65.0.3/22 dev eth0
ip link set eth0 up
ip route add default via 10.65.0.1 dev eth0
echo "Lin IP configured: 10.65.0.3/22, Gateway: 10.65.0.1"
ip addr show dev eth0
