#!/bin/sh
# Konfigurasi Node JJ (VLSM - GNS3)
echo "Configuring Node JJ..."
ip addr flush dev eth0
ip addr add 10.65.14.2/25 dev eth0
ip link set eth0 up
ip route add default via 10.65.14.1 dev eth0
echo "JJ IP configured: 10.65.14.2/25, Gateway: 10.65.14.1"
ip addr show dev eth0
