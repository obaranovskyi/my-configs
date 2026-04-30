function source-all() {
	source $HOME/.zshrc;
	echo " ------------------------- "
	echo "| - source zsh: done      |"

  # setup ranger configs
  mkdir -p ~/.config/ranger
  cat ~/my-configs/ranger/rc.conf > ~/.config/ranger/rc.conf
	echo "| - source ranger: done   |"

  if [[ $(uname -s) == "Darwin" ]]; then
    cat ~/my-configs/amethyst/.amethyst.yml > ~/.amethyst.yml
    echo "| - source amethyst: done |"
  fi

  # sync global CLAUDE.md
  cat ~/my-configs/ai/GLOBAL_CLAUDE.md > ~/.claude/CLAUDE.md
	echo "| - source claude: done   |"

	tmux source $HOME/.tmux.conf;
	echo "| - source tmux: done     |"
	echo " ------------------------- "
}
