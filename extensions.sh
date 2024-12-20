#!/bin/bash
# Setup PikaOS Linux
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
	
echo "+-----------------------------------------------------------------+"
echo "|-------   Hello, $USER. Let's setup Victory-Edition.  -----------|"
echo "+-----------------------------------------------------------------+"
echo -e "-------------------         PikaOS         ---------------------"
echo -e "----------------------------------------------------------------"
echo -e "  ____    ____  __                                              "
echo -e "  \   \  /   / |__| ____ ________    ____    _______ ___  ___   "
echo -e "   \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /   "
echo -e "    \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /     "
echo -e "     \____/   |___||____|  |__|    \_____ / |__|       |_|      "
echo -e "                                                                "
echo -e "----------------------------------------------------------------"
echo -e "       ██████╗  █████╗ ██████╗██████╗██████╗██████╗██████╗       "
echo -e "       ██╔══██╗██╔══██╗╚═══██║╚═══██║  ██╔═╝  ██╔═╝██╔═══╝       "
echo -e "       ██████╔╝██║  ██║  ███╔╝  ███╔╝  ██║    ██║  ██████╗       "
echo -e "       ██╔══██╗███████║ ███╔╝  ███╔╝   ██║    ██║  ██╔═══╝       "
echo -e "       ██║  ██║██║  ██║██╔═╝  ██╔═╝    ██║    ██║  ██║           "
echo -e "       ██████╔╝██║  ██║██████╗██████╗██████╗  ██║  ██████╗       "
echo -e "       ╚═════╝ ╚═╝  ╚═╝╚═════╝╚═════╝╚═════╝  ╚═╝  ╚═════╝       "
echo -e "----------------------------------------------------------------"
echo -e " DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK. "
echo -e "----------------------------------------------------------------"

echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "++++++++         This is NOT a silent install           ++++++++"
echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

}

# Installing Extensions
install_extensions () {

	echo "###############################"
	echo "|    Installing Extensions.   |"
	echo "###############################"
	echo

sleep 6s

PKGS=(
'azwallpaper@azwallpaper.gitlab.com'
'dash-to-dock@micxgx.gmail.com'
'openbar@neuromorph'
'tiling-assistant@leleat-on-github'

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    gext install "$PKG"
done	
}

greeting
install_extensions
