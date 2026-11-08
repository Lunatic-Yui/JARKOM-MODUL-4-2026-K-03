#!/bin/sh
# Konfigurasi Router Deus (VLSM - GNS3)
# Interface:
# eth0: A16 (ke Tachibana) -> 10.65.16.74/30
# eth1: A17 (ke Switch10 - Lilith, Specter) -> 10.65.14.129/25
# eth2: A18 (ke Protocol7) -> 10.65.16.77/30

echo "Configuring Router Deus..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.65.16.74/30 dev eth0
ip link set eth0 up

ip addr add 10.65.14.129/25 dev eth1
ip link set eth1 up

ip addr add 10.65.16.77/30 dev eth2
ip link set eth2 up

# Routing downstream ke Protocol7 & cabang bawah
ip route add 10.65.15.0/26 via 10.65.16.78 dev eth2
ip route add 10.65.15.128/26 via 10.65.16.78 dev eth2
ip route add 10.65.16.0/27 via 10.65.16.78 dev eth2
ip route add 10.65.16.48/29 via 10.65.16.78 dev eth2
ip route add 10.65.16.80/30 via 10.65.16.78 dev eth2
ip route add 10.65.16.84/30 via 10.65.16.78 dev eth2
ip route add 10.65.16.88/30 via 10.65.16.78 dev eth2

# Default gateway ke Tachibana
ip route add default via 10.65.16.73 dev eth0

echo "Deus configured successfully!"
ip route
