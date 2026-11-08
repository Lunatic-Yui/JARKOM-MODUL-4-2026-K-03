#!/bin/sh
# Konfigurasi Router Tachibana (VLSM - GNS3)
# Interface:
# eth0: A14 (ke Wired) -> 10.65.16.70/30
# eth1: A15 (ke Switch9 - Collective, Ghost) -> 10.65.10.1/23
# eth2: A16 (ke Deus) -> 10.65.16.73/30

echo "Configuring Router Tachibana..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.65.16.70/30 dev eth0
ip link set eth0 up

ip addr add 10.65.10.1/23 dev eth1
ip link set eth1 up

ip addr add 10.65.16.73/30 dev eth2
ip link set eth2 up

# Routing downstream ke Deus & cabang bawah
ip route add 10.65.14.128/25 via 10.65.16.74 dev eth2
ip route add 10.65.15.0/26 via 10.65.16.74 dev eth2
ip route add 10.65.15.128/26 via 10.65.16.74 dev eth2
ip route add 10.65.16.0/27 via 10.65.16.74 dev eth2
ip route add 10.65.16.48/29 via 10.65.16.74 dev eth2
ip route add 10.65.16.76/30 via 10.65.16.74 dev eth2
ip route add 10.65.16.80/30 via 10.65.16.74 dev eth2
ip route add 10.65.16.84/30 via 10.65.16.74 dev eth2
ip route add 10.65.16.88/30 via 10.65.16.74 dev eth2

# Default gateway ke Wired
ip route add default via 10.65.16.69 dev eth0

echo "Tachibana configured successfully!"
ip route
