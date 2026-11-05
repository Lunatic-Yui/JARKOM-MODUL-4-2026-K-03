#!/bin/sh
# Konfigurasi Node Specter (VLSM - GNS3)
echo "Configuring Node Specter..."
ip addr flush dev eth0
ip addr add 10.65.14.131/25 dev eth0
ip link set eth0 up
ip route add default via 10.65.14.129 dev eth0
echo "Specter IP configured: 10.65.14.131/25, Gateway: 10.65.14.129"
ip addr show dev eth0
