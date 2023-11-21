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

## Shell Prompt

Shell prompt is customized for [Starship](https://starship.rs/). It is provided with both a light and dark theme. The prompt is subdivided in three areas: left side for system related infos, center area for package and languages infos, and right area for process, time, and extra infos.

The prompt is built through a single string, and does not use the `right_format` functionalty to provide compatiblity with PowerShell (which does not support it).

### Palette

|Light||||
|-|-|-|-|
|`left_fg`|<pre style="background-color:#333333">#333333</pre>|`right_fg`|<pre style="background-color:#333333">#333333</pre>|
|`left_bg`|<pre style="color:#333;background-color:#dddddd">#dddddd</pre>|`right_bg`|<pre style="color:#333;background-color:#dddddd">#dddddd</pre>|
|`success`|<pre style="color:#ddd;background-color:#367a02">#367a02</pre>|`alert`|<pre style="color:#ddd;background-color:#7a0202">#7a0202</pre>|
|`versioning`|<pre style="color:#ddd;background-color:#7a4602">#7a4602</pre>|
|`lines`|<pre style="color:#333;background-color:#dddddd">#dddddd</pre>|

|Dark||||
|-|-|-|-|
|`left_fg`|<pre style="color:#333;background-color:#a0a9cb">#a0a9cb</pre>|`right_fg`|<pre style="color:#333;background-color:#a0a9cb">#a0a9cb</pre>|
|`left_bg`|<pre style="color:#ddd;background-color:#1d2230">#1d2230</pre>|`right_bg`|<pre style="color:#ddd;background-color:#1d2230">#1d2230</pre>|
|`success`|<pre style="color:#333;background-color:#9be342">#9be342</pre>|`alert`|<pre style="color:#ddd;background-color:#e34242">#e34242</pre>|
|`versioning`|<pre style="color:#333;background-color:#e37842">#e37842</pre>|
|`lines`|<pre style="color:#333;background-color:#a0a9cb">#a0a9cb</pre>|

### Format

|Left|Center|Right|
|-|-|-|
|`$os`|`$bun`|`$jobs`|
|`$sudo`|`$c`|`$cmd_duration`|
|`$username`|`$dart`|`$time`|
|`$hostname`|`$deno`||
|`$container`|`$golang`||
|`$docker_context`|`$java`||
|`$shell`|`$lua`||
|`$shlvl`|`$meson`||
|`$nix_shell`|`$nodejs`||
|`$directory`|`$package`||
|`$git_branch`|`$python`||
|`$git_commit`|`$rust`||
|`$git_status`|`$zig`||
|`$status`|

### Preview

**Light**
![Screenshot Light Theme](images/screenshot-prompt-light.jpg)

**Dark**
![Screenshot Dark Theme](images/screenshot-prompt-dark.jpg)
