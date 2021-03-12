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
RESULT=$(curl -s https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json | fx .pma."$QUERY"_link 2> /dev/null)
THEMERESULT=$(curl -s https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json | fx  .pma."$QUERY"_themelink 2> /dev/null)

# Check for fx
if ! [ -x "$(command -v fx)" ]; then
    echo "fx is not installed, attempting to install it"
    doas npm i fx --global
    echo "If it didnt work, install fx manually through npm"
fi

# Check version (SOON)
#if ! [ -x "$(command -v fx)" ]; then
#    echo "fx is not installed, attempting to install it"
#    doas npm i fx --global
#    echo "If it didnt work, install fx manually through npm"
#fi

# Check for curl
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

# Check for git
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

# Help
_print_help(){
  cat << "EOF"
Usage:  pma [OPTIONS]
Options:
    -ft  --ftheme     Fetch a theme
    -f  --fetch       Fetch a plugin/theme
    -l  --list        List plugins/themes
    -i  --info        Info of a plugin/theme
    -h  --help        Show help
    -v  --version     Show version
    -fp  --fplugin    Fetch a plugin
EOF
}

POSITIONAL=()
while [[ $# -gt 0 ]]; do
    case $1 in
        --fetch |-f)
        echo "Fetching plugin/theme..."
        cd $DIR
        git clone --progress --quiet $RESULT 2> /dev/null
        cd $THEMEDIR
        git clone --progress --quiet $THEMERESULT 2> /dev/null 
        echo "Complete!"
            shift
            shift
             ;;
        - -list |-l)
          curl -s https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json | fx .pma
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
            echo "v2.3"
            echo "pma is open source, you can check the repos here:"
            echo "https://kreatea.ml/pluginmanager/pma"
            echo "https://kreatea.ml/pluginmanager/pma-repo"
            shift
            ;;
          --fplugin|-fp)
           cd $DIR
           git clone --progress --quiet $RESULT 
            shift
            shift
            ;;
          --info|-i)
           curl -s https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json | grep -F $QUERY
           shift
           shift
           ;;
        --ftheme|-ft)
           cd $THEMEDIR
           git clone --progress --quiet $THEMERESULT 
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
