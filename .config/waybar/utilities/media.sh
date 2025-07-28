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
		sleep 5
	done
}

function artist() {
	while true; do
		status=$(playerctl status)
		artistname=$(playerctl metadata | grep artist | awk '{print $3}')
		if [[ "$status" == "No players found" ]]; then
			echo $(whoami)
		else
			echo $artistname
		fi
		sleep 5
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

case $1 in
	image) image ;;
	artist) artist ;;
	button) button ;;
esac
