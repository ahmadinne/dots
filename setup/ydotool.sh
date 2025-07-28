#!/bin/bash

echo -ne "username: "
read username

check=$(pacman -Qe ydotool)
if [ ! "$check" ]; then
    paru -S --noconfirm ydotool
fi

groupcheck=$(groups $username)
if [[ "$groupcheck" != *input* ]]; then
	sudo usermod -aG input $username
fi

mkdir -p ~/.config/systemd/user

ydotoolconfig="[Unit]
Description=ydotool daemon

[Service]
Type=simple
ExecStart=/usr/bin/ydotoold 
Restart=no

[Install]
WantedBy=sysinit.target
" 

sudo echo "$ydotoolconfig" | sudo tee /etc/systemd/system/ydotool.service > /dev/null

sudo systemctl daemon-reload
sudo systemctl enable ydotool.service
sudo systemctl start ydotool.service
sudo systemctl status ydotool.service   # check whether the service is running

