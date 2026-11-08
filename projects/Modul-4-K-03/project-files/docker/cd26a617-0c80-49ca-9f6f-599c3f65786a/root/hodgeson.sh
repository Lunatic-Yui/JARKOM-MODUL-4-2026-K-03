#!/bin/sh
# Konfigurasi Node Hodgeson (VLSM - GNS3)
echo "Configuring Node Hodgeson..."
ip addr flush dev eth0
ip addr add 10.65.15.131/26 dev eth0
ip link set eth0 up
ip route add default via 10.65.15.129 dev eth0
echo "Hodgeson IP configured: 10.65.15.131/26, Gateway: 10.65.15.129"
ip addr show dev eth0
