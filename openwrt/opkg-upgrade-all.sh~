#!/bin/ash

# bash script to update all available packages via opkg

# update pkgs first
echo -e "\e[33mDo you want to check for updates first? \e[34m(y/n)\e[39m: "
read update
if [ $update == 'y' ]; then
	echo -e "\e[32mopkg updating...\e[39m"
	echo ""
	opkg update
elif [ $update == 'n' ]; then
	echo -e "\e[31mNOT going to update!\e[39m"
	echo ""
	echo ""
	continue
else
	echo -e "ERROR: Did \e[31mNOT \e[39munderstand your input, so proceeding with opkg update command..."
	echo ""
	opkg update
fi

# check if user wants to confirm each package
echo -e "\e[33mDo you want to confirm each pkg (c), or proceed with yes on every package (a)? \e[34m(C|a)\e[39m: "
read confirm

if [ $confirm == 'c' ]; then
	confirm=true
elif [ $confirm == 'a' ]; then
	confirm=false
else
	echo -e "ERROR: Did \e[31mNOT \e[39munderstand your input, or input was NOT either '\e[32mc' \e[39mor \e[32m'a'\e[39m. Setting confirm to '\e[32mtrue\e[39m'..."
	echo ""
	echo ""
	confirm=true
fi

# capture all needed upgrades and loop through them
upgradable=`opkg list-upgradable | cut -d' ' -f1`
if [ ${#upgradable} > 0 ]; then
	for i in ${upgradable}
	do
		if [ $confirm == true ]; then
			echo -e "\e[33mDo you want to upgrade $i? \e[34m(y/n)\e[39m: "
			echo ""
			echo ""
			read answer
			if [ $answer == "y" ]; then
				echo -e "\e[32mUpgrading $i...\e[39m"
				echo ""
				echo ""
				yes | opkg upgrade $i
			else
				echo -e "\e[31mNot going to upgrade $i\e[39m"
				echo " "
				echo " "	
			fi
		elif [ $confirm == false ]; then
			echo -e "\e[32mUpgrading $i...\e[39m"
			echo ""
			echo ""
			yes | opkg upgrade $i
			sleep 2
		else
			echo -e "\e[31mERROR: Could NOT confirm value of '$confirm' variable.\e[39m"
			echo ""
			echo ""
			echo ""
			echo ""
		fi
	done
else
	echo -e "\e[31mNO \e[32mUpgrades \e[34mavailable at this time.\e[39m"
fi
