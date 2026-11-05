#!/bin/sh
# Konfigurasi Router Knights (VLSM - GNS3)
# Interface:
# eth0: A20 (ke Protocol7) -> 10.65.16.82/30
# eth1: A21 (ke Eiri) -> 10.65.16.49/29
# eth2: A22 (ke Phantoma) -> 10.65.16.85/30

echo "Configuring Router Knights..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.65.16.82/30 dev eth0
ip link set eth0 up

ip addr add 10.65.16.49/29 dev eth1
ip link set eth1 up

ip addr add 10.65.16.85/30 dev eth2
ip link set eth2 up

# Routing downstream ke Phantoma & Shibuya
ip route add 10.65.15.0/26 via 10.65.16.86 dev eth2
ip route add 10.65.16.0/27 via 10.65.16.86 dev eth2
ip route add 10.65.16.88/30 via 10.65.16.86 dev eth2

# Default gateway ke Protocol7
ip route add default via 10.65.16.81 dev eth0

echo "Knights configured successfully!"
ip route
