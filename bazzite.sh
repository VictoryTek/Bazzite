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
echo -e "  ██╔════██  ██     ██╗██   ██╗  ██   ██   ██╗  ██╔═╝██╔════██╗  "
echo -e "   ████╗    ██         ██   ██║  ██   ██   ██║  ██║   ████╗      "
echo -e "      ████╗ ██         ██████╔╝  ██   ██████╔╝  ██║      ████╗   "
echo -e "  ██     ██╗ ██     ██║██║  ██║  ██   ██╔═══╝   ██║  ██     ██╗  "
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

function greeting() {
	clear
	
echo "+------------------------------------------------------------------+"
echo "|---------    Hello, $USER. Let's setup Victory-Edition.  ---------|"
echo "+------------------------------------------------------------------+"
echo -e "--------------------         Bazzite         --------------------"
echo -e "-----------------------------------------------------------------"
echo -e "   ____    ____  __                                              "
echo -e "   \   \  /   / |__| ____ ________    ____    _______ ___  ___   "
echo -e "    \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /   "
echo -e "     \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /     "
echo -e "      \____/   |___||____|  |__|    \_____ / |__|       |_|      "
echo -e "                                                                 "
echo -e "-----------------------------------------------------------------"
echo -e "    █████╗     █████╗  ██████╗ ██████╗██████╗ ██████╗  █████╗    "
echo -e "  ██╔════██  ██     ██╗██   ██╗  ██   ██   ██╗  ██╔═╝██╔════██╗  "
echo -e "   ████╗    ██         ██   ██║  ██   ██   ██║  ██║   ████╗      "
echo -e "      ████╗ ██         ██████╔╝  ██   ██████╔╝  ██║      ████╗   "
echo -e "  ██     ██╗ ██     ██║██║  ██║  ██   ██╔═══╝   ██║  ██     ██╗  "
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

# Set the Hostname
function hostname() {
	
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
function update() {

	echo "###########################"
	echo "|        Updating         |"
	echo "###########################"
	echo
	sleep 6s
	echo	
	topgrade;
	echo
	check_exit_status
}

# Removing unwanted pre-installed packages
function debloat() {

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
function install_pkgs() {

	echo "###############################"
	echo "|     Installing Packages.    |"
	echo "###############################"
	echo

sleep 6s

PKGS=(
'autofs'
'autojump'
'breeze-cursor-theme'
'bpytop'
#'@development-tools'
'dialog'
'elfutils-libelf-devel'
'gparted' # partition management
'kernel-devel'
'kmag'
'meson'
'mono-complete'
'ncdu'
'powerline-fonts'
'progress'
'snapper'
'swtpm'
#'terminator'
'terminus-fonts'
'timeshift'
'tldr'
'trash-cli'
'variety'
#'@virtualization' 
'wine-mono'
'gnome-shell-extension-dash-to-dock'



)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    rpm-ostree install "$PKG"
done

}

# Installing Appearance
function install_appearance() {
	# Starship
	curl -sS https://starship.rs/install.sh | sh -y
	sleep 3s

	# Icons & Cursor
	cd $HOME/Bazzite/
	git clone https://github.com/daniruiz/flat-remix
	git clone https://github.com/daniruiz/flat-remix-gtk
	git clone https://github.com/bikass/kora.git
	wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Classic.tar.xz
	tar -xvf Bibata-Modern-Classic.tar.xz
	sleep 3s
}

# Installing Flatpaks
function install_flatpaks() {
	# Flatpaks
	flatpak install --system flathub com.system76.Popsicle -y
    flatpak install --system flathub com.bitwarden.desktop -y
	#flatpak install --system flathub com.usebottles.bottles -y
	flatpak install --system flathub com.brave.Browser -y
	#flatpak install --system flathub org.gnome.Boxes -y
	#flatpak install --system flathub nl.hjdskes.gcolor3 -y
	flatpak install --system flathub io.github.shiftey.Desktop -y
	flatpak install --system flathub com.discordapp.Discord -y
	flatpak install --system flathub org.prismlauncher.PrismLauncher -y
	flatpak install --system flathub com.simplenote.Simplenote -y
	#flatpak install --system flathub net.nokyan.Resources -y
    flatpak install --system flathub com.vscodium.codium -y
	flatpak install --system flathub dev.deedles.Trayscale -y
	#flatpak install --system flathub com.mattjakeman.ExtensionManager -y
	flatpak install --system flathub io.github.celluloid_player.Celluloid -y
	flatpak install --system flathub ca.desrt.dconf-editor -y
	flatpak install --system flathub org.kde.filelight -y
	flatpak install --system flathub org.gimp.GIMP -y
	flatpak install --system flathub org.kde.gwenview -y
	flatpak install --system flathub org.freedesktop.Piper -y
	flatpak install --system flathub org.wezfurlong.wezterm -y
	sleep 3s

}

# Install extensions
function extensions() {
	#Extension-list
	cd ~
	git clone --recurse-submodules https://github.com/tuberry/extension-list.git && cd extension-list
	meson setup build && meson install -C build
	sleep 3s

	#Tray-Icons-Reloaded
	cd ~
	git clone https://github.com/MartinPL/Tray-Icons-Reloaded.git
	mv $HOME/Tray-Icons-Reloaded ~/.local/share/gnome-shell/extensions/trayIconsReloaded@selfmade.pl
	sleep 3s

	#Gnome 4x Overview UI Tune
	cd ~
	git clone https://github.com/axxapy/gnome-ui-tune.git
	mv $HOME/gnome-ui-tune ~/.local/share/gnome-shell/extensions/gnome-ui-tune@itstime.tech
	sleep 3s

}

# Put the wallpaper
function wallpaper() {

	echo "#########################################"
	echo "|     Setting up Favorite Wallpaper.    |"
	echo "#########################################"
	echo
	sleep 6s
	cd ~/
    git clone https://github.com/VictoryTek/Wallpaper.git

	check_exit_status
}

#
function configs() {
	
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
	#mkdir -p ~/.icons && mkdir -p ~/.themes
#	cp -r flat-remix/Flat-Remix* ~/.icons/ && cp -r flat-remix-gtk/themes/Flat-Remix* ~/.themes/
	sudo mv flat-remix/Flat-Remix* $HOME/.icons/ 
	sudo mv flat-remix-gtk/themes/Flat-Remix* $HOME/.icons/
	sudo rm -rf ~/flat-remix flat-remix-gtk
#	gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Blue-Dark"
	gsettings set org.gnome.desktop.interface icon-theme "kora"
	echo
	gsettings set org.gnome.shell favorite-apps "['brave-browser.desktop', 'firefox.desktop', 'org.gnome.Nautilus.desktop', 'terminator.desktop', 'Bazzite-sync.desktop', 'com.simplenote.Simplenote.desktop', 'virtualbox.desktop', 'com.vscodium.codium.desktop', 'onboard.desktop']"
	gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
	gsettings set org.gnome.desktop.interface clock-format '12h'   
	gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
	echo
	#gsettings set org.fedorahosted.background-logo-extension "True"
	#gsettings set org.fedorahosted.background-logo-extension.logo-file "/usr/share/bazzite-logos/bazzite_lightbackground.svg"
	#gsettings set org.fedorahosted.background-logo-extension.logo-file-dark "/usr/share/bazzite-logos/bazzite_darkbackground.svg"

	check_exit_status
}

# finish
function restart() {
	read -p "Are You ready to restart now? (y/n) " answer 

            if [ "$answer" == "y" ]
            then
            	cecho
		echo "---------------------------------------"
		echo "----        VictoryScript          ----"
		echo "----     has been installed!       ----"
		echo "---------------------------------------"
		echo
		
		echo Restart 
		echo or 
		echo restart gnome shell 
		echo & 
		echo run script 2, victory-finish.sh
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
hostname
update
#debloat
#install_pkgs
install_appearance
install_flatpaks
#extensions
#wallpaper
configs
restart
