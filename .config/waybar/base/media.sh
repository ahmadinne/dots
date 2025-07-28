#!/bin/bash

image(){
    while true; do
        artUrl=$(playerctl metadata | grep artUrl | awk '{print $3}' | sed 's|file://||')
        cache="/tmp/mediacache"
        thumbnail="/tmp/mediathumbnail"
        fullthumb="/tmp/fullthumbnail"
        defaultone="$HOME/.config/waybar/base/thumbnail.png"
        magick $artUrl -thumbnail 720x720^ -gravity center -extent 720x720 $cache

        if [[ "$thumbnail" != "$cache" ]]; then
            cp -rf $artUrl $fullthumb
            cp -rf $cache $thumbnail
        fi
        if [ ! -f "$cache" ]; then
            cp -rf $defaultone $fullthumb
            cp -rf $defaultone $thumbnail
        fi
        sleep 5
    done
}

scrolltitle(){
    while true; do
        teks=$(playerctl metadata | grep title | grep -oP 'title\s+\K.*')
        if [ ! "$teks" ]; then
            teks="Nothing played right now"
        fi
        hitung=$(echo "$teks" | wc -m)
        max_len=25

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
}

case $1 in
    image) image ;;
    scrolltitle) scrolltitle ;;
esac
