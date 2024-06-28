# neofetch
# archey

export ZSH="$HOME/.oh-my-zsh"

# Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="af-magic"
# ZSH_THEME="half-life" # kitty main
# ZSH_THEME="refined"
# ZSH_THEME="nicoulaj"

# Custom themes
# zsh2000 - https://github.com/consolemaverick/zsh2000?tab=readme-ov-file
export ZSH_2000_DISABLE_RIGHT_PROMPT='true'
export ZSH_2000_DISABLE_RVM='true'
ZSH_THEME="zsh2000"


# Configure autosuggestion plugin
ZSH_AUTOSUGGESTION=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [[ ! -d "$ZSH_AUTOSUGGESTION" ]]; then
  echo 'Downloading zsh-autosuggestions plugin ...';
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_AUTOSUGGESTION}
fi

plugins=(
	git
	macos
	web-search
	sudo
	z
	zsh-autosuggestions
	last-working-dir
  colored-man-pages
  dirhistory
)
source $ZSH/oh-my-zsh.sh

# Configure zsh-syntax-highlighting plugin
if [[ ! -d "$HOME/zsh-syntax-highlighting" ]]; then
    echo 'Downloading zsh-syntax-highlighting plugin ...';
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/zsh-syntax-highlighting;
fi
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export CUSTOM_CONFIG_DIR="${HOME}/my-configs/zsh"

# Python scripts setup
PYTHON_SCRIPTS_PATH="${HOME}/my-configs/python"
export PATH="${PYTHON_SCRIPTS_PATH}:$PATH"

# Custom aliases
source $CUSTOM_CONFIG_DIR/custom-aliases/all_aliases.sh

# FZF configuration
if [[ -f ~/.fzf.zsh ]]; then 
  source ~/.fzf.zsh # fzf configuration
  source  $CUSTOM_CONFIG_DIR/scripts/fzf.sh # fzf customizations
fi

# Configure z plugin
Z_FILE=$HOME/.z.sh
export _Z_SRC=$HOME/.z.sh # z-jumper ranger integration
if [[ ! -f "$Z_FILE" ]]; then
    echo 'Downloading z plugin ...';
    curl https://raw.githubusercontent.com/rupa/z/master/z.sh --output ~/.z.sh;
fi

# z extension for browsing
. $HOME/.z.sh

# make default editor - neovim
export EDITOR=nvim

# Correct initialization of python
# More here: https://opensource.com/article/19/5/python-3-default-mac
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# INFO: Testing whether issue is still reproducible
# Fix for tmux to work with the zsh - https://github.com/tmux/tmux/issues/597
# TERM=xterm-256color

# OSX
if [[ $(uname -s) == "Darwin" ]]; then
  # my current version
  export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
  alias python3=/opt/homebrew/bin/python3
fi

# Ubuntu configs
if [[ $(uname -s) == "Linux" ]]; then
	alias python=python3.10
	export PATH="/home/obaranovskyi/nvim/bin:$PATH"
  # to show dolphin icons
  # but you have to install qt5ct
  export QT_QPA_PLATFORMTHEME="qt5ct"
fi



source "$CUSTOM_CONFIG_DIR/scripts/colors.sh"

# Mac setup borders for amethyst
# borders active_color=0xFFB30458 inactive_color=0xff494d64 width=10.0

# Add nvm into PATH:
NVM_V18_PATH="/Users/obaranovskyi/.nvm/versions/node/v18.17.0/bin"

export PATH="${NVM_V18_PATH}:$PATH"
