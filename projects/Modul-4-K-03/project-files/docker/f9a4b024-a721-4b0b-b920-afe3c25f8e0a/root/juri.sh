#!/bin/sh
# Konfigurasi Node Juri (VLSM - GNS3)
echo "Configuring Node Juri..."
ip addr flush dev eth0
ip addr add 10.65.15.194/26 dev eth0
ip link set eth0 up
ip route add default via 10.65.15.193 dev eth0
echo "Juri IP configured: 10.65.15.194/26, Gateway: 10.65.15.193"
ip addr show dev eth0
