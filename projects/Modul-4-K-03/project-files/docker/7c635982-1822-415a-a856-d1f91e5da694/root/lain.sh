#!/bin/sh
# Konfigurasi Node Lain (VLSM - GNS3)
echo "Configuring Node Lain..."
ip addr flush dev eth0
ip addr add 10.65.15.2/26 dev eth0
ip link set eth0 up
ip route add default via 10.65.15.1 dev eth0
echo "Lain IP configured: 10.65.15.2/26, Gateway: 10.65.15.1"
ip addr show dev eth0
