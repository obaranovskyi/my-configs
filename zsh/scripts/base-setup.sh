#!/bin/bash

SYSTEM=$(uname -s)
YES_ANSWER=("yes" "y" "Yes" "YES")
IS_YES=false
CURR_APP_TO_INSTALL=""
CONFIG_FOLDER=~/.config
GIT_DEPENDENCY_FOLDER=~/git-dependencies

function set_is_yes() {
  IS_YES=false
  for ITEM in ${YES_ANSWER[*]}; do
    if [ "$ANSWER" = "$ITEM" ]; then
      IS_YES=true
    fi 
  done
}

function is_app_installed() {
  if [[ ! -x "$(command -v $1)" ]];
  then
    echo false
  else
    echo true
  fi
}

function do_you_want_to_install() {
  CURR_APP_TO_INSTALL=$1
  local IS_CURR_APP_INSTALLED=$(is_app_installed $CURR_APP_TO_INSTALL)
  if [[ $IS_CURR_APP_INSTALLED = false ]]; then 
    echo -e "\033[34mDo you want to install $CURR_APP_TO_INSTALL?"
    read ANSWER
    set_is_yes
  else
    echo -e "\033[32m$CURR_APP_TO_INSTALL already installed."
    IS_YES=false
  fi
}

# -- Kitty --------------------------------------------------------------------------------

do_you_want_to_install kitty
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew install $CURR_APP_TO_INSTALL 
    mkdir -p "$CONFIG_FOLDER/kitty"
    echo "include ~/my-configs/kitty/kitty.conf" > "$CONFIG_FOLDER/kitty/kitty.conf"
  fi
fi

# -- Alacritty ----------------------------------------------------------------------------

do_you_want_to_install alacritty
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew install --cask $CURR_APP_TO_INSTALL 
    mkdir -p "$CONFIG_FOLDER/alacritty"
    echo -e "import: \n  - /Users/obaranovskyi/my-configs/alacritty/alacritty.yml" > "$CONFIG_FOLDER/alacritty/alacritty.yml"
  fi
fi

# --- Installing apps ---------------------------------------------------------------------

APPS_TO_INSTALL=(
  node
  nvm
  lua
  gdu
  bat
  htop
  git-delta
  lsd
  tree
  fd
  curl
  fzf
  xclip
  rename
  watch
  redis
  trash-cli # This one should be used instead of `rm` command
  pass # To store the passwords
  iproute2mac # This is `ip` command
  translate-shell # translator
  ctags # is needed for neovim
)

for APP_TO_INSTALL in ${APPS_TO_INSTALL[*]}; do
  do_you_want_to_install $APP_TO_INSTALL
  if [ "$IS_YES" = true ]; then
    echo "Installing $APP_TO_INSTALL ..."
    if [ "$SYSTEM" == "Darwin" ]; then
      brew install $APP_TO_INSTALL
    fi
  fi
done

# -- Zsh and Oh My Zsh! -------------------------------------------------------------------

do_you_want_to_install zsh
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew install $CURR_APP_TO_INSTALL 
    echo "source ~/my-configs/zsh/.zshrc" > ~/.zhsrc
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
fi

# -- Installing node/npm apps ------------------------------------------------------------------

APPS_TO_INSTALL=(
  wikit
  tldr
  vtop
)

for APP_TO_INSTALL in ${APPS_TO_INSTALL[*]}; do
  do_you_want_to_install $APP_TO_INSTALL
  if [ "$IS_YES" = true ]; then
    echo "Installing $APP_TO_INSTALL ..."
    npm install -g $APP_TO_INSTALL
  fi
done

# -- Installing python packages -----------------------------------------------------------

APPS_TO_INSTALL=(
  pytube
  speedtest-cli
  rich # cmdcheatsheet, cmdtaskmanager dependency
  pipenv
  pytube
  moviepy
  scrapetube
  setuptools
  sqlalchemy # cmdtaskmanager dependency
  pytz # cmdtaskmanager dependency
  wheel # for developing python libs
  twine # for developing python libs
)

for APP_TO_INSTALL in ${APPS_TO_INSTALL[*]}; do
  do_you_want_to_install $APP_TO_INSTALL
  if [ "$IS_YES" = true ]; then
    echo "Installing $APP_TO_INSTALL ..."
    pip install $APP_TO_INSTALL
  fi
done

# -- cmdtaskmanager -----------------------------------------------------------------------

APP_TO_INSTALL=cmdtaskmanager
do_you_want_to_install $APP_TO_INSTALL
if [ "$IS_YES" = true ]; then
  curl -s https://raw.githubusercontent.com/obaranovskyi/cmdtaskmanager/main/install.sh | bash /dev/stdin
fi

# -- cmdenglishassist ---------------------------------------------------------------------

APP_TO_INSTALL=cmdenglishassist
do_you_want_to_install $APP_TO_INSTALL
if [ "$IS_YES" = true ]; then
  curl -s https://raw.githubusercontent.com/obaranovskyi/cmdenglishassist/main/install.sh | bash /dev/stdin
fi

# -- cmdytd -------------------------------------------------------------------------------

APP_TO_INSTALL=cmdytd
do_you_want_to_install $APP_TO_INSTALL
if [ "$IS_YES" = true ]; then
  curl -s https://raw.githubusercontent.com/obaranovskyi/cmdytd/main/install.sh | bash /dev/stdin
fi
# -- cmdcheatsheet ------------------------------------------------------------------------

APP_TO_INSTALL=cmdcheatsheet
do_you_want_to_install $APP_TO_INSTALL
if [ "$IS_YES" = true ]; then
  echo "Installing $APP_TO_INSTALL ..."
  pip install $APP_TO_INSTALL
  cmdcheatsheet -aas unix ~/my-configs/cmdcheatsheet/commands.json
  cmdcheatsheet -aas windows ~/my-configs/cmdcheatsheet/windows_commands.json
  cmdcheatsheet -stas unix
fi

# -- Nvim ---------------------------------------------------------------------------------

do_you_want_to_install nvim
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew install $CURR_APP_TO_INSTALL
    NVIM_CONFIG="package.path = \"~/my-configs/nvim/?.lua;\" .. package.path\nrequire \"init\""
    NVIM_DIRECTORY="$CONFIG_FOLDER/nvim"
    mkdir -p "$NVIM_DIRECTORY"
    echo -e "$NVIM_CONFIG" > "$NVIM_DIRECTORY/init.lua"
  fi
fi

# -- Tmux ---------------------------------------------------------------------------------

do_you_want_to_install tmux
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew install $CURR_APP_TO_INSTALL
    echo "source ~/my-configs/tmux/tmux.conf.common" > ~/.tmux.conf
  fi
fi

# -- Tmuxinator ---------------------------------------------------------------------------

do_you_want_to_install tmuxinator
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew install $CURR_APP_TO_INSTALL
    mkdir ~/.tmuxinator
    cp ~/my-configs/.tmuxinator/*.yml ~/.tmuxinator/
  fi
fi

# -- Vifm ---------------------------------------------------------------------------------

do_you_want_to_install vifm
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew install $CURR_APP_TO_INSTALL
    mkdir -p "$CONFIG_FOLDER/vifm"
    echo "source ~/my-configs/vifm/vifmrc" > "$CONFIG_FOLDER/vifm/vifm"
  fi
fi

# -- Ranger -------------------------------------------------------------------------------

do_you_want_to_install ranger
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew install $CURR_APP_TO_INSTALL
    ranger --copy-config=all
    mkdir -p ~/.config/ranger
    cat ~/my-configs/ranger/rc.conf > ~/.config/ranger/rc.conf
    git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
  fi
fi

# -- Fonts --------------------------------------------------------------------------------

do_you_want_to_install fonts
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    cp -R ~/my-configs/fonts/* ~/.local/share/fonts/
  fi
fi

# -- Findutils ----------------------------------------------------------------------------

do_you_want_to_install findutils
if [ "$IS_YES" = true ]; then
  echo "Installing $CURR_APP_TO_INSTALL ..."
  if [ "$SYSTEM" == "Darwin" ]; then
    brew uninstall grep 
    brew install grep 
    brew install $CURR_APP_TO_INSTALL
  fi
fi

