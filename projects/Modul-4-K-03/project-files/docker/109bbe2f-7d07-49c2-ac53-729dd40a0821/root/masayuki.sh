#!/bin/sh
# Konfigurasi Node Masayuki (VLSM - GNS3)
echo "Configuring Node Masayuki..."
ip addr flush dev eth0
ip addr add 10.65.8.2/23 dev eth0
ip link set eth0 up
ip route add default via 10.65.8.1 dev eth0
echo "Masayuki IP configured: 10.65.8.2/23, Gateway: 10.65.8.1"
ip addr show dev eth0
