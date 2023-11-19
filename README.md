# Dotfiles

This dotfiles repo is configured specifically for **WSL ArchLinux** installations with **zsh** shell.

Most of the configration files should also work without any problem on standalone installations, but some things are specifically made to work in WSL on Windows.

## Install

```zsh
git clone https://github.com/Ragnarokkr/dotfiles.git .dotfiles
cd .dotfiles
./install.zsh
```

## Customizing packages

To add or remove packages from the installation, edit the `packages.list` file. Each row specifies a package to install using one of the following patterns:

- `packager:package`
- `packager:package:command`
- `packager:package:dir_path`

|id|desc|
|-|-|
|`packager`|is the name of the package manager to use for the installation. (Only `pacman` and `nix` are supported.)|
|`package`|is the name of the package to pass to the package manager.
|`command`|is the name of the command provided by the package to be searched, checking if the package needs to be installed.
|`dir_path`|is an unique directory path provided by the package to be searched, checking if the package needs to be installed.

## Installing Steps

|#|action|destination|desc|
|-|-|-|-|
|1|create `.dotfilesrc`|`$HOME`|Contains variables used by the installer itself. It must be sourced in `.zshrc`|
|2|check `packages.list`|
|3|symlink files in `zsh`|`$HOME`|shell configuration files
|4|symlink files in `config`|`$HOME/.config`|configuration files
|5|copy files in `config`|`$HOME/.config`|configuration files which expects sensible private data
|6|symlink files `local/bin`|`$HOME/.local/bin`|custom commands
|7|install **Nix**||install Nix Package Manager
|8|install packages||install packages defined in `packages.list`
|9|run scripts in `setup`||run auxiliary setup scripts for the installed packages
