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
# Licensed under GPLV3, read https://kreatea.ml/pluginmanager/pma/src/branch/main/LICENSE.md for details.
# Made by Kreato
import requests, json, os, sys # import our shit
from pathlib import Path
home = str(Path.home())
from argparse import ArgumentParser # import our shit
if os.path.isfile(home + '/pmaconfig.json'):
    pass
else:
    print("Welcome to Plugin MAnager.")
    print("Please enter your plugin path for Vizality or Powercord.")
    pluginpath = input()
    print("Please enter your theme path for Vizality or Powercord.")
    themepath = input()
    dictionary ={
        "pluginpath" : pluginpath,
        "themepath" : themepath
    }
    json_object = json.dumps(dictionary, indent = 4)
    
    with open(home + "/pmaconfig.json", "w") as outfile:
        outfile.write(json_object)
    print("Configuration complete. Enjoy using Plugin MAnager!")
    print("Note: if you want to change your plugin/theme path, look at " + home + "/pmaconfig.json")
    sys.exit()
f = open(home + '/pmaconfig.json',)
data = json.load(f)
pluginpath =  data['pluginpath'] # Plugin Path (change)
themepath = data['themepath'] # Theme Path (change)
parser = ArgumentParser(prog='pma') # ArgumentParser
parser.add_argument('addon', help="Plugin/theme name.") # Add argument
parser.add_argument('-i', '--info', help="Information about a plugin/theme.", action='store_true') # Add argument
parser.add_argument('-v', '--version', action='version', version='%(prog)s 3.1 RECODE', help="Show program's version number and exit.")
args = parser.parse_args() # Args
content = requests.get("https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json")  # get the json
clone = "git clone " # specify git clone
json = json.loads(content.content) # get json
if args.info == True: # info command
    result = json[args.addon] # get json data
    content.close # close
    print(result) # show result
    sys.exit() # exit
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
