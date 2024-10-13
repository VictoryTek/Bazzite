#!/bin/bash
# Setup my Bazzite Linux
# Ver. 1.0

#####################################################################
#  ____    ____  __                                                 #
#  \   \  /   / |__| ____ ________    ____    _______ ___  ___      #
#   \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /      #
#    \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /        #
#     \____/   |___||____|  |__|    \_____ / |__|       |_|         #
#                                                                   #
# Victory Linux Install script                                      #
# https://github.com/VictoryTek                                     #
#####################################################################


echo -e "-----------------------------------------------------------------"
echo -e "   ____    ____  __                                              "
echo -e "   \   \  /   / |__| ____ ________    ____    _______ ___  ___   "
echo -e "    \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /   "
echo -e "     \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /     "
echo -e "      \____/   |___||____|  |__|    \_____ / |__|       |_|      "
echo -e "                                                                 "
echo -e "-----------------------------------------------------------------"
echo -e "    █████╗     █████╗  ██████╗ ██████╗██████╗ ██████╗  █████╗    "
echo -e "  ██╔════██╗ ██╔════██╗██╔══██╗  ██╔═╝██╔══██╗  ██╔═╝██╔════██╗  "
echo -e "   ████╗    ██╔╝       ██║  ██║  ██║  ██║  ██║  ██║   ████╗      "
echo -e "      ████╗ ██║        ██████╔╝  ██║  ██████╔╝  ██║      ████╗   "
echo -e "  ██╗    ██╗ ██╗    ██║██║  ██║  ██║  ██╔═══╝   ██║  ██╗    ██╗  "
echo -e "    █████╔═╝   █████╔═╝██║  ██║██████╗██║       ██║    █████╔═╝  "
echo -e "    ╚════╝     ╚════╝  ╚═╝  ╚═╝╚═════╝╚═╝       ╚═╝    ╚════╝    "
echo -e "-----------------------------------------------------------------"

# Make sure each command executes properly
check_exit_status() {

	if [ $? -eq 0 ]
	then
		echo
		echo "Success"
		echo
	else
		echo
		echo "[ERROR] Update Failed! Check the errors and try again"
		echo
		
		read -p "The last command exited with an error. Exit script? (y/n) " answer

            if [ "$answer" == "y" ]
            then
                exit 1
            fi
	fi
}

greeting () {
	clear
	
echo    "+---------------------------------------------------------------+"
echo    "|-------    Hello, $USER. Let's setup Victory-Edition.  --------|"
echo    "+---------------------------------------------------------------+"
echo -e "-------------------         Bazzite         ---------------------"
echo -e "-----------------------------------------------------------------"
echo -e "   ____    ____  __                                              "
echo -e "   \   \  /   / |__| ____ ________    ____    _______ ___  ___   "
echo -e "    \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /   "
echo -e "     \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /     "
echo -e "      \____/   |___||____|  |__|    \_____ / |__|       |_|      "
echo -e "                                                                 "
echo -e "-----------------------------------------------------------------"
echo -e "    █████╗     █████╗  ██████╗ ██████╗██████╗ ██████╗  █████╗    "
echo -e "  ██╔════██╗ ██╔════██╗██╔══██╗  ██╔═╝██╔══██╗  ██╔═╝██╔════██╗  "
echo -e "   ████╗    ██╔╝       ██║  ██║  ██║  ██║  ██║  ██║   ████╗      "
echo -e "      ████╗ ██║        ██████╔╝  ██║  ██████╔╝  ██║      ████╗   "
echo -e "  ██╗    ██╗ ██╗    ██║██║  ██║  ██║  ██╔═══╝   ██║  ██╗    ██╗  "
echo -e "    █████╔═╝   █████╔═╝██║  ██║██████╗██║       ██║    █████╔═╝  "
echo -e "    ╚════╝     ╚════╝  ╚═╝  ╚═╝╚═════╝╚═╝       ╚═╝    ╚════╝    "
echo -e "-----------------------------------------------------------------"
echo -e " DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.  "
echo -e "---------------------------------------------------------------- "

echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "+++++++++         This is NOT a silent install          +++++++++"
echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

	
#	sleep 5s
	echo "ARE YOU READY TO START? [y,n]"
	read input

	# did we get an input value?
	if [ "$input" == "" ]; then

	   echo "Nothing was entered by the user"

	# was it a y or a yes?
	elif [[ "$input" == "y" ]] || [[ "$input" == "yes" ]]; then

	   echo "You replied $input, you are ready to start"
	   echo
	   echo "Starting VictoryBazzite install script."
	   echo
	   sleep 3s

	# treat anything else as a negative response
	else

	   echo "You replied $input, you are not ready"
	   echo
	   exit 1

fi

	echo
	
	check_exit_status
}

# Installing Nix
npm () {

	echo "###########################"
	echo "|      Installing Nix     |"
	echo "###########################"
	echo
	echo "This script installs some packages using Nix Package Manager"
	sleep 6s
	echo
	if ! command -v nix 2>&1 >/dev/null
		then
			echo "Nix is not installed"
			echo
			sleep 6s
			echo
			curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
			echo
			echo "Restarting in 15 seconds. Run this script again after restart."
			echo
			sleep 15s
			echo
			shutdown -r now
			echo
		else
			echo "Nix is installed, moving on."
		fi

	echo
	
	check_exit_status
}

# Set the Hostname
hostname () {
	
	echo "############################"
	echo "|     Set the PC Name.     |"
	echo "############################"
	echo
	sleep 6s
	if [ $(whoami) = "root"  ];
then
    useradd -m -G wheel,libvirt -s /bin/bash $username 
	passwd $username
	cp -R /root/Bazzite /home/$username/
    chown -R $username: /home/$username/Bazzite
	read -p "Please name your computer:" nameofmachine
	echo $nameofmachine > /etc/hostname
else
	sudo nano /etc/hostname
fi
	echo
	check_exit_status
}

# Updating 
update () {

	echo "###########################"
	echo "|        Updating         |"
	echo "###########################"
	echo
	sleep 6s
	echo	
	topgrade -y;
	echo
	check_exit_status
}

# Removing unwanted pre-installed packages
debloat () {

	echo "#############################"
	echo "|        Debloating         |"
	echo "#############################"
	echo

	sleep 6s
	PKGS=(
	'org.gnome.clocks'
	'org.gnome.Weather'
	'io.github.nokse22.Exhibit'
	

	)

for PKG in "${PKGS[@]}"; do
    echo "REMOVING: ${PKG}"
    sudo flatpak remove "$PKG" -y
done
	echo
	check_exit_status
}

# Installing Packages
install_pkgs () {

	echo "###############################"
	echo "|     Installing Packages.    |"
	echo "###############################"
	echo

sleep 6s

PKGS=(
'autojump'
'dialog'
'meson'
'ncdu'
'nerdfonts'
'powerline-fonts'
'progress'
'snapper'
'starship'
'swtpm'
'tailscale'
'terminus_font'
'timeshift'
'tldr'
'trash-cli'
'variety'
'gnomeExtensions.dash-to-dock'


)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    nix-env -f "<nixpkgs>" -iA "$PKG"
done

	# Wezterm
	curl -LO https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
	chmod +x WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage

}

# Installing Appearance
install_appearance () {
	# Starship
	#curl -sS https://starship.rs/install.sh | sh
	#sleep 3s

	# Icons & Cursor
	cd $HOME/Bazzite/
	git clone https://github.com/daniruiz/flat-remix
	git clone https://github.com/daniruiz/flat-remix-gtk
	git clone https://github.com/bikass/kora.git
	wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Classic.tar.xz
	tar -xvf Bibata-Modern-Classic.tar.xz
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.tar.xz
	mkdir Meslo
	tar -xvf Meslo.tar.xz -C Meslo
	rm -rf Meslo/LICENSE.txt
	rm -rf Meslo/README.md
	mkdir ~/.local/share/fonts
	cp Meslo/* ~/.local/share/fonts
	fc-cache -vf
	sleep 3s
}

# Installing Flatpaks
install_flatpaks () {
	# Flatpaks
        flatpak install --system flathub com.bitwarden.desktop -y
	flatpak install --system flathub com.brave.Browser -y
	flatpak install --system flathub org.gnome.Boxes -y
	flatpak install --system flathub io.github.shiftey.Desktop -y
	flatpak install --system flathub com.discordapp.Discord -y
	flatpak install --system flathub org.prismlauncher.PrismLauncher -y
	flatpak install --system flathub com.simplenote.Simplenote -y
	#flatpak install --system flathub net.nokyan.Resources -y
        flatpak install --ayatwm flathub com.rustdesk.RustDesk -y
        flatpak install --system flathub com.vscodium.codium -y
	flatpak install --system flathub dev.deedles.Trayscale -y
	flatpak install --system flathub ca.desrt.dconf-editor -y
	flatpak install --system flathub org.gimp.GIMP -y
	flatpak install --system flathub org.freedesktop.Piper -y
	flatpak install --system flathub io.github.zen_browser.zen -y
	sleep 3s

}

# Install extensions
extensions () {

		#Tiling-Assistant
#	cd ~
#	wget https://github.com/Leleat/Tiling-Assistant/releases/download/v48/tiling-assistant@leleat-on-github.shell-extension.zip
#	unzip unzip tiling-assistant\@leleat-on-github.shell-extension.zip -d Tiling-Assistant
#	cd Tiling-Assistant/scripts
#	chmod +x build.sh
#	./build.sh -i
#	sleep 3s

	gnome-extensions enable dash-to-dock@micxgx.gmail.com
#	gnome-extensions enable tiling-assistant@leleat-on-github
	#gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com
	#gnome-extensions enable sound-output-device-chooser@kgshank.net
	gnome-extensions disable logomenu@aryan_k

}

# Put the wallpaper
wallpaper () {

	echo "#########################################"
	echo "|     Setting up Favorite Wallpaper.    |"
	echo "#########################################"
	echo
	sleep 6s
	cd ~/
    git clone https://github.com/VictoryTek/wallpaper.git

	check_exit_status
}

#
configs () {
	
	echo "##################################"
	echo "|     Setting Format changes.    |"
	echo "##################################"
	echo
	sleep 6s
   	echo
    export PATH=$PATH:~/.local/bin
    cp -r $HOME/Bazzite/configs/* $HOME/.config/
    echo
	# enable pre configured bashrc file
    mv $HOME/.config/bashrc $HOME/.config/.bashrc
    mv $HOME/.config/.bashrc $HOME
    echo
	# create a face icon
    mv $HOME/.config/face $HOME/.config/.face
    mv $HOME/.config/.face $HOME
	echo
	cd $HOME/
	mkdir .icons
	cd $HOME/Bazzite/
	sudo mv kora/kora/ $HOME/.icons/
	sudo mv kora/kora-light/ $HOME/.icons/
	sudo mv kora/kora-light-panel/ $HOME/.icons/
	sudo mv kora/kora-pgrey/ $HOME/.icons/
	echo
	#sudo mv flat-remix/Flat-Remix* $HOME/.icons/ 
	#sudo mv flat-remix-gtk/themes/Flat-Remix* $HOME/.icons/
	sudo mv Bibata-Modern-Classic/ $HOME/.icons/
	echo
	gsettings set org.gnome.desktop.interface icon-theme "kora"
	echo
	gsettings set org.gnome.shell favorite-apps "['io.github.zen_browser.zen.desktop', 'com.brave.Browser.desktop', 'org.gnome.Nautilus.desktop', 'org.wezfurlong.wezterm.desktop', 'wezterm.desktop', 'system-update.desktop', 'com.simplenote.Simplenote.desktop', 'org.gnome.Boxes.desktop', 'com.vscodium.codium.desktop']"
	gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
	gsettings set org.gnome.desktop.interface clock-format '12h'   
	gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
	echo


	check_exit_status
}

#CLEAN UP
clean-up () {
	
	echo "##################################"
	echo "|     Cleaning up Left Overs.    |"
	echo "##################################"
	echo
	sleep 6s
	sudo rm -rf /usr/share/backgrounds/gnome
	echo
	sudo rm -rf /usr/share/backgrounds/workstation
	echo
	#sudo rm -rf ~/extension-list
    echo
	sudo rm -rf ~/Tiling-Assistant
	echo
	check_exit_status
}

# finish
restart () {
	read -p "Are You ready to restart now? (y/n) " answer 

            if [ "$answer" == "y" ]
            then
            	
		echo "---------------------------------------"
		echo "----        VictoryScript          ----"
		echo "----     has been installed!       ----"
		echo "---------------------------------------"
		echo
		
		echo Restarting
		echo
		check_exit_status
		
		echo
		echo "Restarting in 15s"
		sleep 15s
                shutdown -r now

            if [ "$answer" == "n" ]
            then
		exit 1

            fi
        fi

}

greeting
npm
hostname
update
debloat
install_pkgs
install_flatpaks
extensions
wallpaper
install_appearance
configs
clean-up
restart
