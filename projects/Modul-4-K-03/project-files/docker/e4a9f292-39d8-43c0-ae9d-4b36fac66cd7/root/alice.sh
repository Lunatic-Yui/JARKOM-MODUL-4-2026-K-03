#!/bin/sh
# Konfigurasi Node Alice (VLSM - GNS3)
echo "Configuring Node Alice..."
ip addr flush dev eth0
ip addr add 10.65.12.2/24 dev eth0
ip link set eth0 up
ip route add default via 10.65.12.1 dev eth0
echo "Alice IP configured: 10.65.12.2/24, Gateway: 10.65.12.1"
ip addr show dev eth0
