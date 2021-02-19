<p align="left">
<img src="./assets/pma.png">
</p>


# PMA
Plugin MAnager for Vizality/Powercord.

## What is this?
This is a Plugin manager (like a package manager, but for plugins and themes) for linux systems that is compatible with Powercord and Vizality.

## How do I use this?
1. Clone the repo
2. Edit the THEMEDIR and DIR using your favorite text editor (Vi, Nano, etc.)
3. Run chmod +x pma (To make it executable)
4. Run bash pma or ./pma


## What are the commands?
You can check the available commands using the `pma -h` command.

## I ran it, nothing happened.Why?
You need to run `pma -h` to see the commands and use it.

## What are the advantages of pma?
Well, there are couple of advantages.
1. Fast - Its much faster than getting plugins manually.
2. Simple - Even a baby can understand it.
3. Customizable - Since its just a shell script, everyone can customize it without much knowledge!

## Can I use this on Windows?
You can use this under wsl, if you point the dir to vizality folder through /mnt/c/.
Still not supported though as i dont run a windows machine.

## Im getting jq/git/curl command not found errors, how can I fix them?
You need to install jq/git/curl to use pma.

Example: On arch, you would run `sudo pacman -S jq git curl`

## Why are you using POSIX Shell and not this [random programming language] instead?
Shell languages are fast and easy to learn/modify, and they make my job easier.

## License
PMA is licensed under MIT license.
