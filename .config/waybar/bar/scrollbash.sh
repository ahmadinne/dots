#!/bin/bash

teks=$(playerctl metadata | grep title | grep -oP 'title\s+\K.*')
hitung=$(echo "$title" | wc -m)
# teks="satu dua tiga empat lima enam tujuh delapan sembilan sepuluh"

# Panjang maksimal setiap baris (misalnya 25 karakter)
max_len=25

if [ "$hitung" -gt "$max_len" ]; then
    teks_gabung="${teks} ${teks}"

    while true; do
        # Loop untuk menampilkan teks yang bergulir
        for ((i=0; i<${#teks}; i++)); do
            # Menampilkan potongan teks sesuai dengan panjang maksimal
            echo -n "${teks_gabung:((i % ${#teks_gabung})):max_len}"
            echo -n -e "\r"  # Menggerakkan kursor kembali ke awal baris
            sleep 0.5  # Delay agar gerakan terlihat
        done
    done
else
    while true; do
        echo -n "$(printf "%-25s" "$teks")"
        echo -n -e "\r"
        sleep 2
    done
fi
