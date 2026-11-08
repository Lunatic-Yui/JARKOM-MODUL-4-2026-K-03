#!/bin/sh
# Konfigurasi Node Chisa (VLSM - GNS3)
echo "Configuring Node Chisa..."
ip addr flush dev eth0
ip addr add 10.65.15.130/26 dev eth0
ip link set eth0 up
ip route add default via 10.65.15.129 dev eth0
echo "Chisa IP configured: 10.65.15.130/26, Gateway: 10.65.15.129"
ip addr show dev eth0
