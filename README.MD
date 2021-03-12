<p align="left">
<img src="./assets/pma.png">
</p>


# PMA
Plugin MAnager for Vizality/Powercord.

## What is this?
This is a Plugin manager (like a package manager, but for plugins and themes) for \*nix/windows systems that is compatible with Powercord and Vizality.

## How do I use this?
1. Clone the repo
2. Edit the pluginpath and themepath using your favorite text editor (Vi, Nano, etc.)
3. Run `make install` as root.

## Compile for windows
You can use Pyinstaller to compile it. Run `pyinstaller pma.py --onefile` then add the exe to your PATH.

## What are the commands?
You can check the available commands using the `pma -h` command.

## Im getting requests not found error(s), how can I fix them?
You need to install request through pip to use pma.

## What are these Legacy versions for?
Those are kept as "ol' times sake" and are not supported.

## License
PMA is licensed under MIT license.
