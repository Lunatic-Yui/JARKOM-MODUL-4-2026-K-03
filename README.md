# JARKOM-MODUL-4-2026-K-03

## Member

| Nama                      | NRP        | Pembagian Kerja |
| ------------------------- | ---------- | --------------- |
| Dafa Ridho Zhafif         | 5027251129 | VLSM            |
| Yovi Prayudya Rizky Ramadhani | 5027251107 | CIDR        |

# Spreadsheet:

Link spreadsheet: https://docs.google.com/spreadsheets/d/1hSZUKqg6CH7iY6-aKsmBk2SQ5mIkcvX5/edit?usp=sharing&ouid=112957782466693334617&rtpof=true&sd=true

# Pengerjaan

## VLSM

## Cisco Packet Tracer - CIDR

Bagian saya (Yovi) adalah CIDR. Perhitungan pada CIDR itu berbeda dengan VLSM yang dimana dia menggunakan penggabungan rute (route summarization) untuk bisa efisiensi tabel routing tersebut. Inspirasinya berasal dari kelompok Mas Ardhi Putra Pradana dengan link githubnya: https://github.com/ardhptr21/JARKOM-MODUL4-K55-2025/tree/main

Beberapa referensi: 
- https://www.rfc-editor.org/info/rfc1519/
- https://github.com/lab-kcks/modul-komdat-jarkom-2026/tree/main/Modul%204

untuk topologinya sebagai berikut:

![image](./assets/cidr/topologi-cidr-1.png)
![image](./assets/cidr/topologi-cidr-2.png)

Disini sudah saya kelompokkan beberapa ke dalam subnetnya masing-masing. Lalu pada sheetsnya:

![image](./assets/cidr/table-cidr-1.png)

### CIDR table

nah untuk perhitugannya sendiri cukup mudah yaitu:

   **a. Menentukan Prefix (CIDR)**
   * **Kebutuhan Host:** 126 Host. (ini pada subnet A1, yaitu 95 + 30 host + 1 gateway)
   * **Rumus:** $2^n - 2 \geq \text{Kebutuhan Host}$.
   * **Pencarian $n$ (Bit Host):**
       * $2^6 - 2 = 62$ (Kurang)
       * $2^{7} - 2 = 126$ (Cukup) $\rightarrow$ Maka, $n = 7$.
   * **Prefix CIDR:** $32 - n = 32 - 7 = \mathbf{/25}$.

   **b. Menghitung Block Size (Total IP)**
   * Rumus: $2^{(32 - \text{Prefix})} = 2^{(32-25)} = 2^{7} = \mathbf{128}$ IP.
   * Karena 1 oktet bernilai 256 dan block size 128 kurang dari 256, maka perhitungannya di **oktet keempat**. Ini berarti subnet ini akan memakan **128 angka** pada oktet keempat IP.

   **c. Menentukan Network ID (NID) & Broadcast**
   * **Network ID (Awal):**
       Karena A1 adalah subnet pertama di Sayap Atas (Block 10.65.24.0/24), maka NID dimulai dari **`10.65.24.0`**.
   * **Next Network (Batas Atas):**
       NID Awal + Block Size (di oktet ke-4) $\rightarrow$ $0 + 128 = 128$.
       Jadi subnet berikutnya dimulai di `10.65.24.128`.
   * **Broadcast Address (Akhir):**
       Satu angka sebelum *Next Network* (`10.65.24.128`).
       Maka Broadcastnya adalah **`10.65.24.127`**.

   **d. Menentukan Range IP Usable**
   * **IP Pertama:** Network ID + 1 $\rightarrow$ **`10.65.24.1`**.
   * **IP Terakhir:** Broadcast - 1 $\rightarrow$ **`10.65.24.126`**.

## Penggabungan Subnet

Untuk penggabungan subnet sendiri saya membagi menjadi 4 wing. Berikut wing sectionnya:

![image](./assets/cidr/wing-section.png)

nah pada spreadsheetnya:

- wing bawah

![image](./assets/cidr/wing-bawah.png)

- wing kanan

![image](./assets/cidr/wing-kanan.png)

- wing kiri

![image](./assets/cidr/wing-kiri.png)

- wing atas

![image](./assets/cidr/wing-atas.png)

- Gabungan

![image](./assets/cidr/gabungan.png)

Kurang lebih pada cisconya sebagai berikut:

- wing bawah
![image](./assets/cidr/penggabungan-subnet-wing-bawah.png)

- wing kanan
![image](./assets/cidr/penggabungan-subnet-wing-kanan.png)

- wing kiri
![image](./assets/cidr/penggabungan-subnet-wing-kiri.png)

- wing atas
![image](./assets/cidr/penggabungan-subnet-wing-atas.png)

- Keseluruhan
![image](./assets/cidr/keseluruhan.png)

## Configuration

Config yang saya pakai untuk cpt:

```
CONFIG ROUTER - 10.65.x.x (static route + summary) - VERSI PERBAIKAN
Router yang sudah dikoreksi dari hasil CDP: Wired, Cybertia, Navi, Psyche, Phantoma. Router lain masih memakai urutan port standar (fa0/0, fa0/1, fa1/0, fa1/1).
Router 2811 hanya punya fa0/0 dan fa0/1, router dengan 3-4 link perlu modul tambahan (tab Physical).
Setelah paste, cocokkan dengan 'show cdp neighbors' di tiap router. Kalau kabel tersambung ke port lain, tukar IP-nya mengikuti kabel.
Paste per router di CLI (mode enable). Baris 'no ip address' menghapus IP lama supaya tidak bentrok.
Saran: beri hostname di switch (Switch1, Switch2, dst.) supaya CDP mudah dibaca. Router10 sekarang bernama Shibuya.

============================================================
ROUTER Wired
============================================================
Catatan: Port sudah disesuaikan dengan hasil CDP (kabel Cybertia di fa0/0, Navi di fa0/1, Tachibana di fa1/0, Switch1 di fa1/1).
Peta port:
  fa0/0  ->  A2  (10.65.24.129/30)  [link ke Cybertia]
  fa0/1  ->  A10  (10.65.23.1/30)  [link ke Navi]
  fa1/0  ->  A14  (10.65.18.201/30)  [link ke Tachibana]
  fa1/1  ->  A3  (10.65.6.1/29)  [link ke Psyche/Copland/Schumann]

enable
configure terminal
hostname Wired
interface fa0/0
 no ip address
interface fa0/1
 no ip address
interface fa1/0
 no ip address
interface fa1/1
 no ip address
exit
interface fa0/0
 description A2
 ip address 10.65.24.129 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A10
 ip address 10.65.23.1 255.255.255.252
 no shutdown
exit
interface fa1/0
 description A14
 ip address 10.65.18.201 255.255.255.252
 no shutdown
exit
interface fa1/1
 description A3
 ip address 10.65.6.1 255.255.255.248
 no shutdown
exit
ip route 10.65.0.0 255.255.252.0 10.65.6.2
ip route 10.65.4.0 255.255.252.0 10.65.6.3
ip route 10.65.8.0 255.255.248.0 10.65.6.4
ip route 10.65.16.0 255.255.252.0 10.65.18.202
ip route 10.65.20.0 255.255.252.0 10.65.23.2
ip route 10.65.24.0 255.255.255.0 10.65.24.130
end
write memory

============================================================
ROUTER Cybertia
============================================================
Catatan: fa0/0 ke Cloud0 (subnet baru 10.65.24.132/30), fa1/0 ke Wired.
Peta port:
  fa0/0  ->  Cloud  (10.65.24.133/30)  [link ke Cloud0]
  fa0/1  ->  A1  (10.65.24.1/25)  [LAN]
  fa1/0  ->  A2  (10.65.24.130/30)  [link ke Wired]

enable
configure terminal
hostname Cybertia
interface fa0/0
 no ip address
interface fa0/1
 no ip address
interface fa1/0
 no ip address
exit
interface fa0/0
 description Cloud0
 ip address 10.65.24.133 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A1
 ip address 10.65.24.1 255.255.255.128
 no shutdown
exit
interface fa1/0
 description A2
 ip address 10.65.24.130 255.255.255.252
 no shutdown
exit
ip route 0.0.0.0 0.0.0.0 10.65.24.129
end
write memory

============================================================
ROUTER Navi
============================================================
Catatan: Modul NM-4E: port tambahan bernama ethernet1/0 dan ethernet1/1, bukan fa1/0 dan fa1/1.
Peta port:
  fa0/0  ->  A10  (10.65.23.2/30)  [link ke Wired]
  fa0/1  ->  A11  (10.65.20.1/24)  [LAN]
  ethernet1/0  ->  A12  (10.65.21.1/26)  [LAN]
  ethernet1/1  ->  A13  (10.65.22.1/24)  [LAN]

enable
configure terminal
hostname Navi
interface fa0/0
 no ip address
interface fa0/1
 no ip address
interface ethernet1/0
 no ip address
interface ethernet1/1
 no ip address
exit
interface fa0/0
 description A10
 ip address 10.65.23.2 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A11
 ip address 10.65.20.1 255.255.255.0
 no shutdown
exit
interface ethernet1/0
 description A12
 ip address 10.65.21.1 255.255.255.192
 no shutdown
exit
interface ethernet1/1
 description A13
 ip address 10.65.22.1 255.255.255.0
 no shutdown
exit
ip route 0.0.0.0 0.0.0.0 10.65.23.1
end
write memory

============================================================
ROUTER Psyche
============================================================
Catatan: Disesuaikan dari CDP: fa0/0 ke Switch1 (A3), fa0/1 ke Switch2 (A4). Cek dengan 'show cdp neighbors' setelah switch diberi hostname.
Peta port:
  fa0/0  ->  A3  (10.65.6.2/29)  [link ke Wired/Copland/Schumann]
  fa0/1  ->  A4  (10.65.0.1/22)  [LAN]

enable
configure terminal
hostname Psyche
interface fa0/0
 no ip address
interface fa0/1
 no ip address
exit
interface fa0/0
 description A3
 ip address 10.65.6.2 255.255.255.248
 no shutdown
exit
interface fa0/1
 description A4
 ip address 10.65.0.1 255.255.252.0
 no shutdown
exit
ip route 10.65.4.0 255.255.252.0 10.65.6.3
ip route 10.65.8.0 255.255.248.0 10.65.6.4
ip route 0.0.0.0 0.0.0.0 10.65.6.1
end
write memory

============================================================
ROUTER Copland
============================================================
Peta port:
  fa0/0  ->  A3  (10.65.6.3/29)  [link ke Wired/Psyche/Schumann]
  fa0/1  ->  A5  (10.65.6.65/26)  [LAN]
  fa1/0  ->  A6  (10.65.4.1/23)  [LAN]

enable
configure terminal
hostname Copland
interface fa0/0
 description A3
 ip address 10.65.6.3 255.255.255.248
 no shutdown
exit
interface fa0/1
 description A5
 ip address 10.65.6.65 255.255.255.192
 no shutdown
exit
interface fa1/0
 description A6
 ip address 10.65.4.1 255.255.254.0
 no shutdown
exit
ip route 10.65.0.0 255.255.252.0 10.65.6.2
ip route 10.65.8.0 255.255.248.0 10.65.6.4
ip route 0.0.0.0 0.0.0.0 10.65.6.1
end
write memory

============================================================
ROUTER Schumann
============================================================
Peta port:
  fa0/0  ->  A3  (10.65.6.4/29)  [link ke Wired/Psyche/Copland]
  fa0/1  ->  A7  (10.65.8.1/29)  [LAN]
  fa1/0  ->  A8  (10.65.8.9/30)  [link ke Accela]

enable
configure terminal
hostname Schumann
interface fa0/0
 description A3
 ip address 10.65.6.4 255.255.255.248
 no shutdown
exit
interface fa0/1
 description A7
 ip address 10.65.8.1 255.255.255.248
 no shutdown
exit
interface fa1/0
 description A8
 ip address 10.65.8.9 255.255.255.252
 no shutdown
exit
ip route 10.65.0.0 255.255.252.0 10.65.6.2
ip route 10.65.4.0 255.255.252.0 10.65.6.3
ip route 10.65.12.0 255.255.252.0 10.65.8.10
ip route 0.0.0.0 0.0.0.0 10.65.6.1
end
write memory

============================================================
ROUTER Accela
============================================================
Peta port:
  fa0/0  ->  A8  (10.65.8.10/30)  [link ke Schumann]
  fa0/1  ->  A9  (10.65.12.1/22)  [LAN]

enable
configure terminal
hostname Accela
interface fa0/0
 description A8
 ip address 10.65.8.10 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A9
 ip address 10.65.12.1 255.255.252.0
 no shutdown
exit
ip route 0.0.0.0 0.0.0.0 10.65.8.9
end
write memory

============================================================
ROUTER Tachibana
============================================================
Peta port:
  fa0/0  ->  A14  (10.65.18.202/30)  [link ke Wired]
  fa0/1  ->  A15  (10.65.16.1/23)  [LAN]
  fa1/0  ->  A16  (10.65.18.205/30)  [link ke Deus]

enable
configure terminal
hostname Tachibana
interface fa0/0
 description A14
 ip address 10.65.18.202 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A15
 ip address 10.65.16.1 255.255.254.0
 no shutdown
exit
interface fa1/0
 description A16
 ip address 10.65.18.205 255.255.255.252
 no shutdown
exit
ip route 10.65.18.0 255.255.254.0 10.65.18.206
ip route 0.0.0.0 0.0.0.0 10.65.18.201
end
write memory

============================================================
ROUTER Deus
============================================================
Peta port:
  fa0/0  ->  A16  (10.65.18.206/30)  [link ke Tachibana]
  fa0/1  ->  A17  (10.65.18.1/25)  [LAN]
  fa1/0  ->  A18  (10.65.18.193/30)  [link ke Protocol7]

enable
configure terminal
hostname Deus
interface fa0/0
 description A16
 ip address 10.65.18.206 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A17
 ip address 10.65.18.1 255.255.255.128
 no shutdown
exit
interface fa1/0
 description A18
 ip address 10.65.18.193 255.255.255.252
 no shutdown
exit
ip route 10.65.18.128 255.255.255.192 10.65.18.194
ip route 10.65.18.196 255.255.255.252 10.65.18.194
ip route 10.65.19.0 255.255.255.128 10.65.18.194
ip route 0.0.0.0 0.0.0.0 10.65.18.205
end
write memory

============================================================
ROUTER Protocol7
============================================================
Peta port:
  fa0/0  ->  A18  (10.65.18.194/30)  [link ke Deus]
  fa0/1  ->  A19  (10.65.18.129/26)  [LAN]
  fa1/0  ->  A20  (10.65.18.197/30)  [link ke Knights]

enable
configure terminal
hostname Protocol7
interface fa0/0
 description A18
 ip address 10.65.18.194 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A19
 ip address 10.65.18.129 255.255.255.192
 no shutdown
exit
interface fa1/0
 description A20
 ip address 10.65.18.197 255.255.255.252
 no shutdown
exit
ip route 10.65.19.0 255.255.255.128 10.65.18.198
ip route 0.0.0.0 0.0.0.0 10.65.18.193
end
write memory

============================================================
ROUTER Knights
============================================================
Peta port:
  fa0/0  ->  A20  (10.65.18.198/30)  [link ke Protocol7]
  fa0/1  ->  A21  (10.65.19.97/29)  [LAN]
  fa1/0  ->  A22  (10.65.19.105/30)  [link ke Phantoma]

enable
configure terminal
hostname Knights
interface fa0/0
 description A20
 ip address 10.65.18.198 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A21
 ip address 10.65.19.97 255.255.255.248
 no shutdown
exit
interface fa1/0
 description A22
 ip address 10.65.19.105 255.255.255.252
 no shutdown
exit
ip route 10.65.19.0 255.255.255.128 10.65.19.106
ip route 0.0.0.0 0.0.0.0 10.65.18.197
end
write memory

============================================================
ROUTER Phantoma
============================================================
Catatan: Disesuaikan dari CDP: fa0/1 ke Shibuya, fa1/0 ke Switch11.
Peta port:
  fa0/0  ->  A22  (10.65.19.106/30)  [link ke Knights]
  fa0/1  ->  A24  (10.65.19.109/30)  [link ke Shibuya]
  fa1/0  ->  A23  (10.65.19.65/27)  [LAN]

enable
configure terminal
hostname Phantoma
interface fa0/0
 no ip address
interface fa0/1
 no ip address
interface fa1/0
 no ip address
exit
interface fa0/0
 description A22
 ip address 10.65.19.106 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A24
 ip address 10.65.19.109 255.255.255.252
 no shutdown
exit
interface fa1/0
 description A23
 ip address 10.65.19.65 255.255.255.224
 no shutdown
exit
ip route 10.65.19.0 255.255.255.192 10.65.19.110
ip route 0.0.0.0 0.0.0.0 10.65.19.105
end
write memory

============================================================
ROUTER Shibuya
============================================================
Peta port:
  fa0/0  ->  A24  (10.65.19.110/30)  [link ke Phantoma]
  fa0/1  ->  A25  (10.65.19.1/26)  [LAN]

enable
configure terminal
hostname Shibuya
interface fa0/0
 description A24
 ip address 10.65.19.110 255.255.255.252
 no shutdown
exit
interface fa0/1
 description A25
 ip address 10.65.19.1 255.255.255.192
 no shutdown
exit
ip route 0.0.0.0 0.0.0.0 10.65.19.109
end
write memory

============================================================
IP HOST / SERVER (isi manual di tiap perangkat)
============================================================
LAN  Host                      IP                Mask              Gateway
A1   JJ, MyuMyu                10.65.24.2, .3    255.255.255.128   10.65.24.1
A4   Karl, Lin                 10.65.0.2, .3     255.255.252.0     10.65.0.1
A5   Juri                      10.65.6.66        255.255.255.192   10.65.6.65
A6   Masayuki                  10.65.4.2         255.255.254.0     10.65.4.1
A7   Akashic                   10.65.8.2         255.255.255.248   10.65.8.1
A9   Omnipresence, Denpa       10.65.12.2, .3    255.255.252.0     10.65.12.1
A11  Alice, Reika              10.65.20.2, .3    255.255.255.0     10.65.20.1
A12  Taro                      10.65.21.2        255.255.255.192   10.65.21.1
A13  Yasuo, Kuma, Miho         10.65.22.2, .3, .4 255.255.255.0    10.65.22.1
A15  Collective, Ghost         10.65.16.2, .3    255.255.254.0     10.65.16.1
A17  Lilith, Specter           10.65.18.2, .3    255.255.255.128   10.65.18.1
A19  Chisa, Hodgeson           10.65.18.130, .131 255.255.255.192  10.65.18.129
A21  Eiri                      10.65.19.98       255.255.255.248   10.65.19.97
A23  Semi                      10.65.19.66       255.255.255.224   10.65.19.65
A25  Lain, Mika                10.65.19.2, .3    255.255.255.192   10.65.19.1

Cloud0 tidak perlu IP (Cloud-PT tidak bisa di-ping). Link Cloud0-Cybertia: 10.65.24.132/30, Cybertia .133.
```

disini agak bruteforcing dan sebenernya ada kesalahn namun saya sudah perbaikin semua dan config yang saya kirim sudah benar. Hasilnya sebagai berikut:

![image](./assets/cidr/Success.png)

File: [Praktikum-Jarkom-K-08.pkt](./Praktikum-Jarkom-K-08.pkt)
