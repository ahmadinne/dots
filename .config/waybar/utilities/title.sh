#!/bin/bash
    while true; do
        teks=$(playerctl metadata | grep title | grep -oP 'title\s+\K.*')
        if [ ! "$teks" ]; then
            teks="Nothing played right now"
        fi
        hitung=$(echo "$teks" | wc -m)
        max_len=18

        if [ "$hitung" -gt "$max_len" ]; then
            teks_gabung="${teks} ${teks}"

            for ((i=0; i<${#teks}; i++)); do
                echo "{\"text\": \"${teks_gabung:((i % ${#teks_gabung})):max_len}\", \"class\": \"\"}" | jq --unbuffered --compact-output .
                sleep 1
            done
        else
            echo "{\"text\": \"$(printf "%-25s" "$teks")\", \"class\": \"\"}" | jq --unbuffered --compact-output .
            sleep 2
        fi
    done

