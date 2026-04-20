tmux_color_scheme() {
  for i in {0..255}; do
      printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
  done
}

alias tcs='tmux_color_scheme';
alias tl='tmux a'
alias tn='tmux new-session -t main'
alias mux='tmuxinator'

tmux-help() {
    echo "\n${COLOR_YELLOW}  Tmux:";
    echo "${COLOR_BLUE}  tcs ${COLOR_GREEN}- show colors"
    echo "${COLOR_BLUE}  tl ${COLOR_GREEN}- open last session"
    echo "${COLOR_BLUE}  mux <project_name> ${COLOR_GREEN}- use tmuxinator"
    echo "${COLOR_BLUE}  tn ${COLOR_GREEN}- open new session with name main"
}

