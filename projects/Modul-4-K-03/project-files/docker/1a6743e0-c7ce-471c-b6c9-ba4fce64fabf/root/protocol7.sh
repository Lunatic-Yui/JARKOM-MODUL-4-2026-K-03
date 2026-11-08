#!/bin/sh
# Konfigurasi Router Protocol7 (VLSM - GNS3)
# Interface:
# eth0: A18 (ke Deus) -> 10.65.16.78/30
# eth1: A19 (ke Switch11 - Chisa, Hodgeson) -> 10.65.15.129/26
# eth2: A20 (ke Knights) -> 10.65.16.81/30

echo "Configuring Router Protocol7..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2

ip addr add 10.65.16.78/30 dev eth0
ip link set eth0 up

ip addr add 10.65.15.129/26 dev eth1
ip link set eth1 up

ip addr add 10.65.16.81/30 dev eth2
ip link set eth2 up

# Routing downstream ke Knights & cabang bawah
ip route add 10.65.15.0/26 via 10.65.16.82 dev eth2
ip route add 10.65.16.0/27 via 10.65.16.82 dev eth2
ip route add 10.65.16.48/29 via 10.65.16.82 dev eth2
ip route add 10.65.16.84/30 via 10.65.16.82 dev eth2
ip route add 10.65.16.88/30 via 10.65.16.82 dev eth2

# Default gateway ke Deus
ip route add default via 10.65.16.77 dev eth0

echo "Protocol7 configured successfully!"
ip route
