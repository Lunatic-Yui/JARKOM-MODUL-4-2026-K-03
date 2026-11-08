#!/bin/sh
# Konfigurasi Router Wired (Core Hub VLSM - GNS3)
# Interface:
# eth0: A2 (ke Cyberia) -> 10.65.16.58/30
# eth1: A3 (ke Switch2 - Psyche, Copland, Schumann) -> 10.65.16.33/29
# eth2: A10 (ke Navi) -> 10.65.16.65/30
# eth3: A14 (ke Tachibana) -> 10.65.16.69/30

echo "Configuring Router Wired..."
echo 1 > /proc/sys/net/ipv4/ip_forward

ip addr flush dev eth0
ip addr flush dev eth1
ip addr flush dev eth2
ip addr flush dev eth3

ip addr add 10.65.16.58/30 dev eth0
ip link set eth0 up

ip addr add 10.65.16.33/29 dev eth1
ip link set eth1 up

ip addr add 10.65.16.65/30 dev eth2
ip link set eth2 up

ip addr add 10.65.16.69/30 dev eth3
ip link set eth3 up

# Default route ke Cyberia (Akses Internet)
ip route add default via 10.65.16.57 dev eth0

# Routing ke Sayap Kiri (via Switch2)
# ke Psyche (A4)
ip route add 10.65.0.0/22 via 10.65.16.34 dev eth1
# ke Copland (A5, A6)
ip route add 10.65.8.0/23 via 10.65.16.35 dev eth1
ip route add 10.65.15.192/26 via 10.65.16.35 dev eth1
# ke Schumann & Accela (A7, A8, A9)
ip route add 10.65.4.0/22 via 10.65.16.36 dev eth1
ip route add 10.65.16.40/29 via 10.65.16.36 dev eth1
ip route add 10.65.16.60/30 via 10.65.16.36 dev eth1

# Routing ke Sayap Kanan - Navi (A11, A12, A13)
ip route add 10.65.12.0/24 via 10.65.16.66 dev eth2
ip route add 10.65.13.0/24 via 10.65.16.66 dev eth2
ip route add 10.65.15.64/26 via 10.65.16.66 dev eth2

# Routing ke Sayap Bawah - Tachibana & seterusnya (A15 - A25)
ip route add 10.65.10.0/23 via 10.65.16.70 dev eth3
ip route add 10.65.14.128/25 via 10.65.16.70 dev eth3
ip route add 10.65.15.0/26 via 10.65.16.70 dev eth3
ip route add 10.65.15.128/26 via 10.65.16.70 dev eth3
ip route add 10.65.16.0/27 via 10.65.16.70 dev eth3
ip route add 10.65.16.48/29 via 10.65.16.70 dev eth3
ip route add 10.65.16.72/30 via 10.65.16.70 dev eth3
ip route add 10.65.16.76/30 via 10.65.16.70 dev eth3
ip route add 10.65.16.80/30 via 10.65.16.70 dev eth3
ip route add 10.65.16.84/30 via 10.65.16.70 dev eth3
ip route add 10.65.16.88/30 via 10.65.16.70 dev eth3

echo "Wired configured successfully!"
ip route
