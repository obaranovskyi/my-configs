function hk() {
  if [[ -z $1 ]]; then
    cat ~/my-configs/hotkeys.md
  else
    grep -wi --color $1 ~/my-configs/hotkeys.md
  fi
}

hk-help() {
    echo "\n${COLOR_YELLOW}  Hotkeys:";
    echo "${COLOR_BLUE}  hk <command/app_name> ${COLOR_GREEN}- search for command/app hotkeys";
}
