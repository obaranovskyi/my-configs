function source-all() {
  local RESET="\033[0m"
  local BOLD="\033[1m"
  local DIM="\033[2m"
  local GREEN="\033[32m"
  local CYAN="\033[36m"
  local YELLOW="\033[33m"
  local WHITE="\033[97m"

  local CHECK="${GREEN}✔${RESET}"
  local DIVIDER="${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

  echo ""
  echo -e "${DIVIDER}"
  echo -e "  ${BOLD}${CYAN}Sourcing environment...${RESET}"
  echo -e "${DIVIDER}"

  source $HOME/.zshrc
  echo -e "  ${CHECK}  ${WHITE}zsh${RESET}"

  mkdir -p ~/.config/ranger
  cat ~/my-configs/ranger/rc.conf > ~/.config/ranger/rc.conf
  echo -e "  ${CHECK}  ${WHITE}ranger${RESET}"

  if [[ $(uname -s) == "Darwin" ]]; then
    cat ~/my-configs/amethyst/.amethyst.yml > ~/.amethyst.yml
    echo -e "  ${CHECK}  ${WHITE}amethyst${RESET}"
  fi

  cat ~/my-configs/ai/claude/GLOBAL_CLAUDE.md > ~/.claude/CLAUDE.md
  cp -r ~/my-configs/ai/claude/skills/. ~/.claude/skills/
  echo -e "  ${CHECK}  ${WHITE}claude${RESET}"

  tmux source $HOME/.tmux.conf
  echo -e "  ${CHECK}  ${WHITE}tmux${RESET}"

  echo -e "${DIVIDER}"
  echo -e "  ${BOLD}${GREEN}All done!${RESET}"
  echo -e "${DIVIDER}"
  echo ""
}
