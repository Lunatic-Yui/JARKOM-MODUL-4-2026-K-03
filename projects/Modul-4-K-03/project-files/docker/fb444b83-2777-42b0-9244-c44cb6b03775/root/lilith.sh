#!/bin/sh
# Konfigurasi Node Lilith (VLSM - GNS3)
echo "Configuring Node Lilith..."
ip addr flush dev eth0
ip addr add 10.65.14.130/25 dev eth0
ip link set eth0 up
ip route add default via 10.65.14.129 dev eth0
echo "Lilith IP configured: 10.65.14.130/25, Gateway: 10.65.14.129"
ip addr show dev eth0
