#!/bin/sh
# Konfigurasi Node Semi (VLSM - GNS3)
echo "Configuring Node Semi..."
ip addr flush dev eth0
ip addr add 10.65.16.2/27 dev eth0
ip link set eth0 up
ip route add default via 10.65.16.1 dev eth0
echo "Semi IP configured: 10.65.16.2/27, Gateway: 10.65.16.1"
ip addr show dev eth0
