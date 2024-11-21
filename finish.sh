#!/bin/bash
# Setup my Bazzite Linux pt.2
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

enable_extensions () {

	echo "###############################"
	echo "|     Enabling Extensions.    |"
	echo "###############################"
	echo

sleep 6s

	gnome-extensions enable dash-to-dock@micxgx.gmail.com
	gnome-extensions enable tiling-assistant@leleat-on-github
	gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com
	gnome-extensions enable openbar@neuromorph
	gnome-extensions enable azwallpaper@azwallpaper.gitlab.com
	echo
	gnome-extensions disable logomenu@aryan_k

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
	mv $HOME/.config/wezterm.lua $HOME/.config/.wezterm.lua
    mv $HOME/.config/.wezterm.lua $HOME
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
	gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true' 
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
update
enable_extensions
#configs
restart
