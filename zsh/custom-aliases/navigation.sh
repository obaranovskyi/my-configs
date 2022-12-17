if [[ $(uname -s) == "Linux" ]]; then
  function fcd() {
    cd "$(find ~/ -type d | fzf)"
  }

  function open() {
    xdg-open "$(find ~/ -type f | fzf)"
  }

  # INFO: only for the Ubuntu
  # alias fd="fdfind"

  # TODO: Would be great to have something similar on the osx
  alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"
fi

if [[ $(uname -s) == "Darwin" ]]; then
  function gfcd() {
    cd ~ && cd $(fd -t d | fzf)
  }
  alias g="gfcd"

  function fcd() {
    cd $(fd -t d | fzf)
  }
fi

alias f="fcd"

navigation-help() {
    echo "\n${COLOR_YELLOW}  Navigation:";
    echo "${COLOR_BLUE}  gfcd, g ${COLOR_GREEN}- Global search for folder in the fzf"
    echo "${COLOR_BLUE}  fcd, f ${COLOR_GREEN}- Search for folder in the fzf"
}
