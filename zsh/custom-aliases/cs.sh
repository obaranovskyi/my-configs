function cheatsheet() {
  local value=$(curl -s "https://raw.githubusercontent.com/obaranovskyi/cheatsheet/main/src/$1.md")
  echo "$value" | bat -l 'markdown' -n
}

alias cs="cheatsheet"

cs-help() {
    echo "\n${COLOR_YELLOW}  Cheatsheet:";
    echo "${COLOR_BLUE}  cs <app-name> ${COLOR_GREEN}- display cheatsheet for <app-name>"
}
