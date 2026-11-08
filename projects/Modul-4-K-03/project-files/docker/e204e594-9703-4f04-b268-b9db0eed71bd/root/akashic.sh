#!/bin/sh
# Konfigurasi Node Akashic (VLSM - GNS3)
echo "Configuring Node Akashic..."
ip addr flush dev eth0
ip addr add 10.65.16.42/29 dev eth0
ip link set eth0 up
ip route add default via 10.65.16.41 dev eth0
echo "Akashic IP configured: 10.65.16.42/29, Gateway: 10.65.16.41"
ip addr show dev eth0
