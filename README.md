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
