#!/bin/bash
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
