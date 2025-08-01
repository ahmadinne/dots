#!/bin/bash
function image() {
	while true; do
		artUrl=$(playerctl metadata | grep artUrl | awk '{print $3}' | sed 's|file://||')
		cache="/tmp/mediacache"
		thumbnail="/tmp/mediathumbnail"
		fullthumb="/tmp/fullthumbnail"
		defaultone="$HOME/.config/waybar/utilities/thumbnail.png"
		magick $artUrl -thumbnail 720x720^ -gravity center -extent 720x720 $cache

		if [[ "$thumbnail" != "$cache" ]]; then
			cp -rf $artUrl $fullthumb
			cp -rf $cache $thumbnail
		fi
		if [ ! -f "$cache" ]; then
			cp -rf $defaultone $fullthumb
			cp -rf $defaultone $thumbnail
		fi
	done
}

function metadata(){
    while true; do
        status=$(playerctl status)
        if [[ "$status" == Playing ]] || [[ "$status" == Paused ]]; then
            artist=$(playerctl metadata | grep artist | grep -oP 'artist\s+\K.*')
            title=$(playerctl metadata | grep title | grep -oP 'title\s+\K.*')
            text="You're Listening to..."

            case $1 in
                title)
                    echo "{\"text\": \"${title}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
                artist)
                    echo "{\"text\": \"${artist}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
                text)
                    echo "{\"text\": \"${text}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
            esac
        else
			artist="unknown"
            title="Nothin'"
            text="You're listening?"

            case $1 in
                title)
                    echo "{\"text\": \"${title}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
                artist)
                    echo "{\"text\": \"${artist}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
                text)
                    echo "{\"text\": \"${text}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
            esac
        fi
        sleep 1
    done
}

function artist() {
	while true; do
		check=$(playerctl status)
		names=$(playerctl metadata | grep artist | grep -oP 'artist\s+\K.*')
		if [[ "$check" == Playing ]]; then
			echo "${names}"
		else
			echo "Unknown"
		fi
	done
}

function wmname() {
	wmname="$(xprop -id $(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"
	echo $wmname
}

function screenrecord() {
	while true; do
		check=$(ps -ef | grep '[w]f-recorder'| awk '{print $2}')
		if [[ "$check" ]]; then
			echo "{\"class\": \"recording\"}" | jq --unbuffered --compact-output .
		else
			echo "{\"class\": \"default\"}" | jq --unbuffered --compact-output .
		fi
	done
}

function button() {
	while true; do
		check=$(playerctl status)
		if [[ "$check" == Playing ]]; then
			echo "{\"class\": \"playing\"}" | jq --unbuffered --compact-output .
		else
			echo "{\"class\": \"paused\"}" | jq --unbuffered --compact-output .
		fi
	done
}

function autobar() {
    activeworkspace=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')
    windowstatus=$(hyprctl clients -j | jq ".[] | select(.workspace.id == ${activeworkspace})" | grep -c '"floating": false')
	if [ "$windowstatus" -lt 1 ]; then
		echo "{\"class\": \"invisible\"}" | jq --unbuffered --compact-output .
	else
		echo "{\"class\": \"visible\"}" | jq --unbuffered --compact-output .
	fi
}

case $1 in
	image) image ;;
	artist) artist ;;
	button) button ;;
	wmname) wmname ;;
	screenrecord) screenrecord ;;
	autobar) autobar ;;
esac
