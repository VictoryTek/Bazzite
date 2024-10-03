#!/bin/bash

# Installing Nix
nix () {

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


}

nix