#!/bin/sh
# Konfigurasi Node Eiri (VLSM - GNS3)
echo "Configuring Node Eiri..."
ip addr flush dev eth0
ip addr add 10.65.16.50/29 dev eth0
ip link set eth0 up
ip route add default via 10.65.16.49 dev eth0
echo "Eiri IP configured: 10.65.16.50/29, Gateway: 10.65.16.49"
ip addr show dev eth0
