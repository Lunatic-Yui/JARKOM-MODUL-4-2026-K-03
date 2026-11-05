#!/bin/sh
# Konfigurasi Node MyuMyu (VLSM - GNS3)
echo "Configuring Node MyuMyu..."
ip addr flush dev eth0
ip addr add 10.65.14.3/25 dev eth0
ip link set eth0 up
ip route add default via 10.65.14.1 dev eth0
echo "MyuMyu IP configured: 10.65.14.3/25, Gateway: 10.65.14.1"
ip addr show dev eth0
