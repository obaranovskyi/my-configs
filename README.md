```
                                    __ _
 _ __ ___  _   _    ___ ___  _ __  / _(_) __ _
| '_ ` _ \| | | |  / __/ _ \| '_ \| |_| |/ _` |
| | | | | | |_| | | (_| (_) | | | |  _| | (_| |
|_| |_| |_|\__, |  \___\___/|_| |_|_| |_|\__, |
           |___/                         |___/
```

#### Usage
 - [hotkeys](./HOTKEYS.md)

---

This project contains information how to setup my environment. \
Clone this folder into your root (`~/`)

---

#### `nvim` v0.4.0 setup

To apply current configuration to vim v0.4.0, insert into your `~/.config/nvim/init.vim` file the following line of code:

```bash
source ~/my-configs/vim/init.vim
```
---

#### `nvim` v0.7.0 and higher setup
To apply current configuration to vim v0.7.0 and higher, insert into your `~/.config/nvim/init.lua` file the following line of code:

```bash
package.path = "/Users/obaranovskyi/my-configs/nvim/?.lua;" .. package.path
require "init"
```

**Note** Install `lua` as well.

---

#### `tmux` setup
To apply current configuration to tmux, insert into your `~/.tmux.conf` file the following line of code:

```bash
source ~/my-configs/tmux/tmux.conf.common
```

---

#### Tmuxinator
Config file has to be stored in `~/.tmuxinator/*` folder.  
If project name is sample it has to be stored as `~/.tmuxinator/sample.yml`

To copy all the projects run copy script:
```bash
~/my-configs/.tmuxinator/.copy_projects.sh
```

---

#### `zsh` setup
To apply current configuration to zsh, insert into your `~/.zshrc` file the following line of code:

```bash
source /Users/obaranovskyi/my-configs/zsh/.zshrc
```

---

#### `vifm` setup
To apply current configuration to `vifm`, insert into your `~/.config/vifm/vifmrc` file the following line of code:

```bash
source ~/my-configs/vifm/vifmrc
```

---

#### `ranger` setup
To apply current configuration to `ranger`:

init ranger's default configuration:
```bash
ranger --copy-config=all
```
then copy config:
```bash
mkdir -p ~/.config/ranger && cat ~/my-configs/ranger/rc.conf > ~/.config/ranger/rc.conf
```
copy devicons, so that the ranger can display icons:
```bash
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
```

---

#### Alacrity setup
To apply current configuration to `alacrity`, insert into your `~/.config/alacritty/alacritty.yml` file the following line of code:

```bash
import:
  - /Users/obaranovskyi/my-configs/alacritty/alacritty.yml
```

---

#### Kitty setup
To apply current configuration to kitty terminal, add the following line to kitty config located at _~/.config/kitty/kitty.conf_
```
include ~/my-configs/kitty/kitty.conf
```

---

#### Fonts setup
To apply current fonts copy all fonts from `./fonts/*` and paste to `~/.local/share/fonts/` (for Mac). 

On linux put the fonts to `/usr/local/share/fonts/`

--- 

#### Xmonad
Copy the `~/my-configs/xmonad/xmonad.hs` to `/home/obaranovskyi/.xmonad/xmonad.hs`

---

#### Xmobar setup 
Copy the file form `~/my-configs/xmonad/xmobarrc` to `/home/obaranovskyi/.config/xmobar/.xmobarrc`

---

#### Possible installations

[+] - required  
[~] - would be great to have  
[-] - not necessary

- [+] [balenaEtcher](https://www.balena.io/etcher/?ref=etcher_footer)
- [+] [ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [+] [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [+] ZSH Z [`z` plugin](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/z/z.sh)
- [-] [Broot](https://dystroy.org/broot/)
- [+] [Ranger](https://github.com/ranger/ranger)
- [~] [LSD (LS Deluxe)](https://github.com/Peltoche/lsd)
- [+] [NerdFonts](https://www.nerdfonts.com/) - [Hack](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack/Regular/complete)
- [+] [Trash](https://github.com/ali-rantakari/trash)
- [~] [Git Delta](https://github.com/dandavison/delta#installation)
- [+] [Tmux](https://github.com/tmux/tmux/wiki)
- [+] [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
- [+] [Neovim](https://neovim.io/)
- [~] [vifm](https://vifm.info/)
- [+] [gdu](https://www.tecmint.com/gdu-disk-usage-analyzer-for-linux/)
- [+] [bat](https://github.com/sharkdp/bat)
- [+] [htop](https://htop.dev/)
- [+] [cURL](https://curl.se/)
- [+] [gpg](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
- [+] [pass](https://www.passwordstore.org/)
- [+] [translate-shell](https://github.com/soimort/translate-shell)
- [~] [bpytop](https://github.com/aristocratos/bpytop)
- [+] [Alacritty](https://github.com/alacritty/alacritty)
- [-] [neofetch](https://github.com/dylanaraps/neofetch)
- [-] [Calcurse](https://github.com/lfos/calcurse)
- [-] [SC-IM](https://github.com/andmarti1424/sc-im)
- [+] [figlet](http://www.figlet.org/)
- [+] [FZF](https://github.com/junegunn/fzf)
- [+] asciiquarium
- [+] [cheat.sh](https://cheat.sh/) - No need to install due to usage with curl
- [+] [Tree](https://sourabhbajaj.com/mac-setup/iTerm/tree.html)
- [+] [fd](https://github.com/sharkdp/fd)
- [+] [Taskwarrior](https://taskwarrior.org/)
- [+] [NetworkManager](https://wiki.archlinux.org/title/NetworkManager)
- [+] networkctl
- [+] rename
- [+] xclip
- [+] watch
- [+] [lsscsi](https://sg.danny.cz/scsi/lsscsi.html#:~:text=The%20lsscsi%20command%20lists%20information,currently%20attached%20to%20the%20system.)
- [+] [anki](https://apps.ankiweb.net/)
- [+] NPM packages
    - [+] [wikit](https://www.npmjs.com/package/wikit)
    - [+] [tldr](https://github.com/tldr-pages/tldr)
    - [~] [vtop](https://github.com/MrRio/vtop)
    - [+] [trash-cli](https://www.npmjs.com/package/trash-cli)
- [+] Pip packages
    - [+] [rich](https://github.com/Textualize/rich)
    - [+] [pytube](https://pytube.io/en/latest/)
    - [+] [speedtest-cli](https://github.com/sivel/speedtest-cli)

--- 

#### Ubuntu
- [+] Qt5ct
  ```bash
  sudo apt install qt5ct
  ```
  - Then you might configure the icons and fonts using the following command:
  ```bash
  qt5ct
  ```
- [+] Xmonad, Xmobar, dmenu
  ```bash
  sudo apt install xterm 
  sudo apt install libghc-xmonad-contrib-dev libghc-xmonad-dev dmenu
  sudo apt install compton nitrogen
  sudo apt install xmobar
  ```
  **Note** If it's first installation, install `xterm` as well to have a terminal from where to configure the rest.

  nitrogen - is used to set a wallpaper

---

#### Arch
- [+] Qt5ct
  ```bash
  sudo pacman -S qt5
  sudo pacman -S qt5ct
  sudo pacman -S the_silver_searcher
  yay install adwaita-qt
  sudo pacman -S systemsettings
  ```
**Note** `the_silver_searcher` is required for many nvim search plugins, for instance for `ctrlsf`.

**Note** `qt5ct` is required for configuring icons and fonts.

**Note** `adwaita-qt` is an icon theme.

Add necessary variables such as `QT_QPA_PLATFORMTHEME`,
more here: https://unix.stackexchange.com/questions/680483/how-to-add-qt-qpa-platformtheme-qt5ct-environment-variable-in-arch-linux

- Useful apps:
    - dolphin (file manager)
    - okular (pdf reader)

###### `.xprofile` config
An xprofile file, `~/.xprofile` and `/etc/xprofile`, allows you to execute commands at teh beginning of the X user session - before the window manager is started.
More about the window manager: https://wiki.archlinux.org/title/Window_manager
```
# keyboard Layout 
setxkbmap &

# Wallpaper
nitrogen --restore &

# Compositor
picom -f --no-fading-openclose &
```

###### Remap caps lock to escape
```bash
setxkbmap -option caps:escape
```

--- 

#### Mac
- [+] GNU Grep 
  ```bash
  brew uninstall grep
  brew install grep
  ```
  - after this can be used `ggrep` or an alias `alias grep="ggrep"`

- [~] `findutils` 
  ```bash
  brew install findutils
  ```
  - after this can be used `glocate` or an alias `alias locate="glocate"`
  - after this can be used `gupdatedb` or an alias `alias updatedb="gupdatedb"`
  - after this can be used `gfind` or an alias `alias find="gfind"`


###### Add application shortcut
https://ladedu.com/how-to-launch-apps-with-keyboard-shortcuts-on-a-mac/

---

