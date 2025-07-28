#!/bin/bash

percentage (){
    pacman="󰮯"
    fullDot="━"
    eatenDot="—"
    progressBarLength=10

    while true; do
        status=$(playerctl status)
        if [[ "$status" == Playing ]]; then
            raw_duration=$(playerctl metadata | grep length | awk '{print $3}')
            total_duration=$((${raw_duration}/1000000))
            minute=$((${total_duration}/60))
            hitung=$(echo "scale=2; $total_duration / 60" | bc)
            current_position=$(playerctl position | cut -d'.' -f1)
            percentage=$((${current_position}*100/${total_duration}))

            progressBar=""
            for ((i=0; i<$progressBarLength; i++)); do
                if [ $i -lt $((percentage*progressBarLength/100)) ]; then
                    progressBar+="$eatenDot"
                elif [ $i -eq $((percentage*progressBarLength/100)) ]; then
                    progressBar+="$pacman"
                else
                    progressBar+="$fullDot"
                fi
            done

            echo "{\"text\": \"${progressBar}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .

            sleep 1
        else
            echo "{\"text\": \"———\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .

            sleep 1
        fi
    done
}

image(){
    while true; do
        artUrl=$(playerctl metadata | grep artUrl | awk '{print $3}' | sed 's|file://||')
        cache="/tmp/mediacache"
        thumbnail="/tmp/mediathumbnail"
        magick $artUrl -thumbnail 720x720^ -gravity center -extent 720x720 $cache

        if [[ "$thumbnail" != "$cache" ]]; then
            cp -rf $cache $thumbnail
        fi
        # cp -rf $artUrl /tmp/mediathumbnail
        sleep 5
    done
}

case $1 in
    percentage) percentage ;;
	image) image ;;
esac
