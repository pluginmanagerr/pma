#!/usr/bin/env bash
# ________  _____ ______   ________                 ________  ___  ___  ___     
#|\   __  \|\   _ \  _   \|\   __  \               |\   ____\|\  \|\  \|\  \    
#\ \  \|\  \ \  \\\__\ \  \ \  \|\  \  ____________\ \  \___|\ \  \\\  \ \  \   
# \ \   ____\ \  \\|__| \  \ \   __  \|\____________\ \  \  __\ \  \\\  \ \  \  
#  \ \  \___|\ \  \    \ \  \ \  \ \  \|____________|\ \  \|\  \ \  \\\  \ \  \ 
#   \ \__\    \ \__\    \ \__\ \__\ \__\              \ \_______\ \_______\ \__\
#    \|__|     \|__|     \|__|\|__|\|__|               \|_______|\|_______|\|__|
# Plugin MAnager-GUI
# v0.5
# NOT SUPPORTED ANYMORE
# LICENSED UNDER MIT

if ! [ -x "$(command -v jq)" ]; then
    echo "jq is not installed, attempting to install it"
    sudo pacman -S jq
    sudo apt install jq 
    sudo zypper install jq
    echo "If it didnt work install  jq manually"
fi

if ! [ -x "$(command -v curl)" ]; then
    echo "curl is not installed, attempting to install it"
    sudo pacman -S curl
    sudo apt install curl 
    sudo zypper install curl
    echo "If it didnt work install  curl manually"
fi

if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed, attempting to install it"
    sudo pacman -S git
    sudo apt install git 
    sudo zypper install git
    echo "If it didnt work install  git manually"
fi

if ! [ -x "$(command -v yad)" ]; then
    echo "yad is not installed, attempting to install it"
    sudo pacman -S yad
    sudo apt install yad 
    sudo zypper install yad
    echo "If it didnt work install, yad manually"
fi


if ! [ -x "$(command -v zenity)" ]; then
    echo "zenity is not installed, attempting to install it"
    sudo pacman -S zenity
    sudo apt install zenity
    sudo zypper install zenity
    echo "If it didnt work, install  zenity manually"
fi


#Custom repository support, for more information https://kreatea.ml/pluginmanager/pma-repo
#list2=`curl -s https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json | jq -r  ".repository"`
dialog=$(yad --title "pma-gui" --form --field="Plugin dir" --field="Plugin name" --button="Plugin List:0" --button="Start:3")
dir=$(echo "$dialog" | awk 'BEGIN {FS="|" } { print $1 }')
name=$(echo "$dialog" | awk 'BEGIN {FS="|" } { print $2 }')
result=$(curl -s https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json | jq -r  """.bruh.""$name""_link")

#cant understand Unable to find package prompt
if [ $? -eq 3 ]
then
cd "$dir" || exit
git clone --progress "$result"
notify-send "Plugin MAnager" "Install complete."
exit 0 
else
echo ""
fi

if [ $? == 0 ]
then
  curl -s https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json | jq -r  ".bruh" | zenity --text-info
  $dialog
fi

if [ "$result" == null ]
then 
zenity --error --title="Error" --text="Unable to find the package" --no-wrap
exit 0
else
cd "$dir" || exit
git clone --progress "$result"
notify-send "Plugin MAnager" "Install complete."
yad --title="Finished" --width=300  --button="gtk-ok:0"  --text="Finished install."
fi
