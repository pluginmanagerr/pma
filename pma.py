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
import requests, subprocess, json, os, sys # import our shit
from pathlib import Path
home = str(Path.home())
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
data = json.load(open(f"{home}/pmaconfig.json"))
if os.path.isfile(home + '/pmacache.json'):
    pass
else:
    content = requests.get("https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json")  # get the json
    with open(home + "/pmacache.json", "wb") as outfile:
        outfile.write(content.content)
pluginpath =  data['pluginpath'] # Plugin Path (change)
themepath = data['themepath'] # Theme Path (change)
args = sys.argv[1:]
if "-h" in args or "--help" in args or len(args) == 0:
    print("""pma - a package manager, but for plugins and themes.
╔═════╦═══════════════════╦═══════════════════════════════════════════════╦══════════════════╗
║ -i  ║ --info            ║ Information about a plugin/theme.             ║ pma -i addon     ║
╠═════╬═══════════════════╬═══════════════════════════════════════════════╬══════════════════╣
║ -V  ║ --version         ║ Display version.                              ║ pma -v           ║
╠═════╬═══════════════════╬═══════════════════════════════════════════════╬══════════════════╣
║ -h  ║ --help            ║ Display help.                                 ║ pma -h           ║
╠═════╬═══════════════════╬═══════════════════════════════════════════════╬══════════════════╣
║ -S  ║ --sync            ║ Install addons.                              ║ pma -S addon     ║
╠═════╬═══════════════════╬═══════════════════════════════════════════════╬══════════════════╣
║ -y  ║ --refresh         ║ Refresh cached repository.                   ║ pma -y           ║
╚═════╩═══════════════════╩═══════════════════════════════════════════════╩══════════════════╝""")
    exit()
if "-V" in args or "--version" in args:
    print(r"""
   ________  _____ ______   ________     
 P| \   __  \|\   _ \  _   \|\   __  \    
  L\ \  \|\  \ \  \\\__\ \  \ \  \|\  \   
   U\ \   ____\ \  \\|__| \  \ \   __  \  
    G\ \  \___|\ \  \    \ \  \ \  \ \  \ 
     I\ \__\    \ \__\    \ \__\ \__\ \__\
      N\|__|     \|__|     \|__|\|__|\|__|
                  M  A      N  A  G  E   R 
     pma, version 3.5""")
    exit()
clone     = "git clone " # specify git clone
json_file = json.load(open(f"{home}/pmacache.json")) # get json
if "-i" in args or "--info" in args: # info command
    try:
        result      = json_file[args[1]] # get json data
        result_link = json_file[args[1] + "_link"] # get json data
        content.close # close
        print(f"""
        Description:    {result}
        Link:           {result_link}                                      
        """) # show result
        sys.exit() # exit
    except Exception:
        print("ERROR: Not enough arguments")
if "-y" in args or "--refresh" in args:
    try:
        content = requests.get("https://kreatea.ml/pluginmanager/pma-repo/raw/branch/main/vizality.json")  # get the json
        with open(home + "/pmacache.json", "wb") as outfile:
            outfile.write(content.content)
            print("Refreshed repository.")
    except Exception:
        print("ERROR: refreshing repository failed.")
        
if "-S" in args or "--sync" in args:
    try: # Plugin
        result = json_file[args[1] + "_link"] # get json data 
        os.chdir(pluginpath) # Specifying the path where the cloned project needs to be copied
        os.system(clone + result) # Cloning (plugin)
    except Exception:
        pass
    try: # Theme
        result = json_file[args[1] + "_themelink"] # get json data
        os.chdir(themepath) # Specifying the path where the cloned project needs to be copied
        os.system(clone + resultheme) # Cloning (theme)
    except Exception:
        pass
