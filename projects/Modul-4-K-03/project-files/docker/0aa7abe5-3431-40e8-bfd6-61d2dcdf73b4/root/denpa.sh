#!/bin/sh
# Konfigurasi Node Denpa (VLSM - GNS3)
echo "Configuring Node Denpa..."
ip addr flush dev eth0
ip addr add 10.65.4.3/22 dev eth0
ip link set eth0 up
ip route add default via 10.65.4.1 dev eth0
echo "Denpa IP configured: 10.65.4.3/22, Gateway: 10.65.4.1"
ip addr show dev eth0
