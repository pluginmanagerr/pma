#!/usr/bin/env python3
# ________  _____ ______   ________     
#|\   __  \|\   _ \  _   \|\   __  \    
#\ \  \|\  \ \  \\\__\ \  \ \  \|\  \   
# \ \   ____\ \  \\|__| \  \ \   __  \  
#  \ \  \___|\ \  \    \ \  \ \  \ \  \ 
#   \ \__\    \ \__\    \ \__\ \__\ \__\
#    \|__|     \|__|     \|__|\|__|\|__|
# Plugin MAnager
# v3 - RECODE
# Licensed under MIT, read https://kreatea.ml/pluginmanager/pma/src/branch/main/LICENSE for details.
# Made by Kreato
import requests, json, os, sys # import our shit
from argparse import ArgumentParser # import our shit
pluginpath = r"C:\Users\Kreato\Desktop" # Plugin Path (change)
themepath = r"C:\Users\Kreato\Desktop" # Theme Path (change)
parser = ArgumentParser(prog='pma') # ArgumentParser
parser.add_argument('addon', help="Plugin/theme name.") # Add argument
args = parser.parse_args() # Args
content = requests.get("https://raw.githubusercontent.com/kreat0/pma-repo/main/vizality.json")  # get the json
clone = "git clone " # specify git clone
json = json.loads(content.content) # get json
try: # Plugin
    result = json[args.addon + "_link"] # get json data
    content.close() # close
    os.chdir(pluginpath) # Specifying the path where the cloned project needs to be copied
    os.system(clone + result) # Cloning (plugin)
except Exception:
    pass
try: # Theme
    resultheme = json[args.addon + "_themelink"] # get json data (for themes)
    content.close() # close
    os.chdir(themepath) # Specifying the path where the cloned project needs to be copied
    os.system(clone + resultheme) # Cloning (theme)
except Exception:
    pass