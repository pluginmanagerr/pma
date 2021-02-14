<p align="left">
<img src="./assets/pma.png">
</p>


# PMA
Plugin MAnager for Vizality/Powercord
# What is this?
This is a Plugin manager (like a package manager, but for plugins) for linux systems that is compatible with Powercord and Vizality.

# How do i use this?
1. Clone the repo
2. run chmod +x pma
3. run bash pma or ./pma (DO NOT RUN AS ROOT)
4. we recommend running ./pma -d first to configure directory.

# What are the commands?
```
Usage:  pma [OPTIONS]
Options:
    -i  --install     Install powercord
    -l  --list        List of plugins
    -h  --help        Show help
    -v  --version     Show version
    -f  --fetch       Fetch a plugin
```

# What are the advantages of pma?
Well there are couple of advantages
1. Fast - Its much faster than getting plugins manually
2. Simple - Even a baby can understand it 
3. Customizable - Since its just a shell script, everyone can customize it without much knowledge!

# How can i install themes with this?
For now you **cant**

# Can i use this on Windows?
There should be a way to run this on windows under WSL, but its not supported and not recommended.

# Im getting jq/git/curl command not found errors, how can i fix them?
You need to install jq/git/curl to use pma.

# Why are you using shell and not this [random programming language] instead?
shell is fast and easy to learn/modify, and it makes my job easier.

# License
pma is licensed under MIT license.
