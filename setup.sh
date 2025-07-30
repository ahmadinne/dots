#! /bin/bash
user=$(whoami)
echo $user > /tmp/username.txt
username=$(cat /tmp/username.txt)

sudo pacman -Syu
packages=(
	alacritty
	base-devel
	bc
	brightnessctl
	cliphist
	file-roller
	git
	greetd
	grim
	gvfs
	hypridle
	hyprland
	hyprlock
	hyprpicker
	hyprpolkitagent
	imagemagick
	jq
	mako
	mpv
	nemo
	nwg-look
	pavucontrol
	rofi-wayland
	rofi-calc
	starship
	swayosd
	swww
	ttc-iosevka
	unzip
	waybar
	wf-recorder
	xdg-desktop-portal-hyprland
)

aurhelper (){
	check=$(pacman -Qe | awk '{print $1}' | grep -x "paru-bin")
	if [[  "$check" ]]; then
		echo "You've already have AUR Helper installed."
		echo "Continuing..."
	else
		if [[ ! $(pacman -Qe | awk '{print $1}' | grep -x git) ]]; then sudo pacman -S --noconfirm git; fi
		if [[ ! $(pacman -Qe | awk '{print $1}' | grep -x base-devel) ]]; then sudo pacman -S --noconfirm base-devel; fi

		git clone https://aur.archlinux.org/paru-bin &&
		cd paru-bin &&
		makepkg -si &&
		cd ..
		rm -rf paru-bin &&
		echo "Paru(AUR Helper) has been installed."
		echo "Continuing..."
	fi
}

installpkgs (){
	for pkg in ${packages[@]}; do
		if [[ ! $(pacman -Qe | awk '{print $1}' | grep -x $pkg) ]]; then
			paru -S --noconfirm $pkg
		fi
	done
}

greetdsetup (){
	echo -e "[terminal] \nvt = \"current\" \n\n[default_session] \ncommand = \"hyprland\" \nuser = \"${username}\"" > /tmp/config.toml
	sudo rm /etc/greetd/config.toml
	sudo cp /tmp/config.toml /etc/greetd/config.toml
}

systemdsetup (){
	pekeji=(
		greetd
		swayosd-libinput-backend
		)
	for pekejis in ${pekeji[@]}; do
		if [[ $(systemctl status $pekejis | grep -c enabled) -gt 0 ]]; then
			echo $pekejis is already active
		else
			sudo systemctl enable $pekejis
			sudo systemctl start $pekejis
			echo $pekejis activated
		fi
	done
}

aurhelper
installpkgs
greetdsetup
systemdsetup
