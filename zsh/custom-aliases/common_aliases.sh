#
# TODO: I need to extract functions from here as it's not only the aliases but functions as well
#
alias l.='ls -d .* --color=auto';
if [[ $(uname -s) == "Darwin" ]]; then
  alias l.='ls -d .*';
fi

alias la='lsd -al';
alias ll='lsd -l';
alias l='lsd';
alias lt='lsd --tree';

alias eq='exit';
alias config='z config && nvim'
alias notes='z my-notes/README.md && nvim'
alias v="nvim"
alias trm="trash-put"

# set grep color
export GREP_COLORS='ms=01;34'
alias cgrep="grep -wi --color"

# Use GNU grep instead of OSX grep
if [[ $(uname -s) == "Darwin" ]]; then
	alias grep="ggrep"
	# alias locate="glocate"
	# alias updatedb="gupdatedb"
  # alias find="gfind"
fi

function source-all() {
	source $HOME/.zshrc;
	echo " ----------------------- "
	echo "| - source zsh: done    |"

  # setup ranger configs
  mkdir -p ~/.config/ranger
  cat ~/my-configs/ranger/rc.conf > ~/.config/ranger/rc.conf
	echo "| - source ranger: done |"

	tmux source $HOME/.tmux.conf;
	echo "| - source tmux: done   |"
	echo " ----------------------- "
}

function hk() {
  grep -wi --color $1 ~/my-configs/hotkeys.md
}

# translate-shell
if [[ -x "$(command -v trans)" ]];
then
  function trw() {
    trans :uk -b "$*"
  }
fi

function give-rights() {
  chmod 755 $1
  ls -l $1
}

alias my-public-ip='echo $(curl -s https://api.ipify.org)'

function create-executable() {
  local SCRIPT_NAME=$1
  touch $SCRIPT_NAME
  chmod +x $SCRIPT_NAME
  ls -l $SCRIPT_NAME
}

# copy password to clipboard
function cptc() {
  if [[ $(uname -s) -eq 'Darwin' ]];
  then
    pass $1 | pbcopy
  else
    pass $1 | xclip
  fi
}

# TODO: Under construction - battery percentage (OSX)
# INFO: Works in terminal but not as a alias
# pmset -g batt | sed 1,1d | awk '{ print $3 }' | sed 's/%;//g'

common-help() {
    echo "\n${COLOR_YELLOW}  Common:";
    echo "${COLOR_BLUE}  my-public-ip ${COLOR_GREEN}- show current ip address";
    echo "${COLOR_BLUE}  cptc <website_name> ${COLOR_GREEN}- show current ip address";
    echo "${COLOR_BLUE}  trw <word_to_translate> ${COLOR_GREEN}- translate word in short mode";
    echo "${COLOR_BLUE}  trm <file_to_remove> ${COLOR_GREEN}- remove file using the trash-cli app";
    echo "${COLOR_BLUE}  cgrep <test_to_search> ${COLOR_GREEN}- search for the text using the colored grep";
    echo "${COLOR_BLUE}  give-rights f.sh ${COLOR_GREEN}- give rights to shell script";
    echo "${COLOR_BLUE}  source-all ${COLOR_GREEN}- source tmux, zsh";
    echo "${COLOR_BLUE}  hk <command/app_name> ${COLOR_GREEN}- search for command/app hotkeys";
    # echo "${COLOR_BLUE}  battery-percentage ${COLOR_GREEN}- Show battery percentage";
    echo "${COLOR_BLUE}  eq ${COLOR_GREEN}- exit terminal"
    echo "${COLOR_BLUE}  v ${COLOR_GREEN}- open neovim"
    echo "${COLOR_BLUE}  create-executable <file>.sh ${COLOR_GREEN}- create <file> with the executable rights"
}
