#!/usr/bin/env bash
# ________  _____ ______   ________     
#|\   __  \|\   _ \  _   \|\   __  \    
#\ \  \|\  \ \  \\\__\ \  \ \  \|\  \   
# \ \   ____\ \  \\|__| \  \ \   __  \  
#  \ \  \___|\ \  \    \ \  \ \  \ \  \ 
#   \ \__\    \ \__\    \ \__\ \__\ \__\
#    \|__|     \|__|     \|__|\|__|\|__|
# Plugin MAnager
# v2
# LICENSED UNDER MIT

DIR="/the/path/of/plugins/folder"
THEMEDIR="/the/path/to/theme/folder"
QUERY=`echo $2 | sed 's/ /+/'g`
RESULT=`curl -s https://pluginmanagerr.github.io/pma-repo/vizality.json | jq -r  ".pma."$QUERY"_link"`
THEMERESULT=`curl -s https://pluginmanagerr.github.io/pma-repo/vizality.json | jq -r  ".pma."$QUERY"_themelink"`
if ! [ -x "$(command -v jq)" ]; then
    echo "jq is not installed, attempting to install it"
    sudo pacman -S jq
    doas pacman -S jq
    sudo apt install jq
    doas apt install jq
    sudo emerge -a jq --autounmask
    doas emerge -a jq --autounmask
    sudo zypper install jq
    doas zypper install jq
    echo "If it didnt work, install  jq manually"
fi

if ! [ -x "$(command -v curl)" ]; then
    echo "cURL is not installed, attempting to install it"
    sudo pacman -S curl
    doas pacman -S curl
    sudo apt install curl 
    doas apt install curl 
    sudo zypper install curl
    doas zypper install curl
    sudo emerge -a curl --autounmask  
    doas emerge -a curl --autounmask
    echo "If it didnt work, install  curl manually"
fi

if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed, attempting to install it"
    sudo pacman -S git
    doas pacman -S git
    sudo apt install git 
    doas apt install git 
    sudo zypper install git
    doas zypper install git
    sudo emerge -a git --autounmask
    doas emerge -a git --autounmask
    echo "If it didnt work, install  git manually"
fi


_print_help(){
  cat << "EOF"
Usage:  pma [OPTIONS]
Options:
    -t  --theme       Install a theme
    -i  --info        Info of a plugins, themes, and descriptions of those
    -l  --list        List of plugins
    -h  --help        Show help
    -v  --version     Show version
    -p  --plugin      Install a plugin
EOF
}

POSITIONAL=()
while [[ $# -gt 0 ]]; do
    case $1 in
         --list|-l)
          curl -s https://pluginmanagerr.github.io/pma-repo/vizality.json | jq -r  ".pma"
            shift
            shift
            ;;
           --version|-v)
           echo '
 ________  _____ ______   ________     
|\   __  \|\   _ \  _   \|\   __  \    
\ \  \|\  \ \  \\\__\ \  \ \  \|\  \   
 \ \   ____\ \  \\|__| \  \ \   __  \  
  \ \  \___|\ \  \    \ \  \ \  \ \  \ 
   \ \__\    \ \__\    \ \__\ \__\ \__\
    \|__|     \|__|     \|__|\|__|\|__|'              
            echo "v2"
            echo "pma is open source, you can check the repos here:"
            echo "https://github.com/pluginmanagerr/pma"
            echo "https://github.com/pluginmanagerr/pma-repo"
            shift
            ;;
          --plugin|-p)
           cd $DIR
           git clone --progress --quiet $RESULT 
            shift
            shift
            ;;
        --theme|-t)
           cd $THEMEDIR
           git clone --progress --quiet $THEMERESULT 
            shift
            shift
            ;;
          --info|-i)
           curl -s https://pluginmanagerr.github.io/pma-repo/vizality.json | jq -r --arg QUERY "$QUERY"  ".pma.$QUERY"
            shift
            shift
            ;;
        --help|-h)
            _print_help
            shift
            shift
            ;;
        *)
          echo "Option not found"
          _print_help
          shift
          ;;
    esac
done
