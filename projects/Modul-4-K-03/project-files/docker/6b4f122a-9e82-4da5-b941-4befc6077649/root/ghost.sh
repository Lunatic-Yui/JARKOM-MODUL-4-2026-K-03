#!/bin/sh
# Konfigurasi Node Ghost (VLSM - GNS3)
echo "Configuring Node Ghost..."
ip addr flush dev eth0
ip addr add 10.65.10.3/23 dev eth0
ip link set eth0 up
ip route add default via 10.65.10.1 dev eth0
echo "Ghost IP configured: 10.65.10.3/23, Gateway: 10.65.10.1"
ip addr show dev eth0
