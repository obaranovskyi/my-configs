repo_name='obaranovskyi/cheatsheet'
url='https://github.com'
raw_url='https://raw.githubusercontent.com'
main_src='main/src'

function cs() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  if [[ ! $value == *"404: Not Found"* ]]; then
    printf "$value"
  fi
}

function csbat() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  if [[ ! $value == *"404: Not Found"* ]]; then
    printf "$value" | bat -l 'markdown' -n
  fi
}

function csglow() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  if [[ ! $value == *"404: Not Found"* ]]; then
    printf "$value" | glow
  fi
}

function csless() {
  local value=$(curl -s "${raw_url}/${repo_name}/${main_src}/$1.md")
  if [[ ! $value == *"404: Not Found"* ]]; then
    printf "$value" | less
  fi
}

function csl() {
  printf "$(curl -s "${raw_url}/${repo_name}/main/content.md")"
}


cs-help() {
    echo "\n${COLOR_YELLOW}  Cheatsheet:";
    echo "${COLOR_BLUE}  cs <app-name> ${COLOR_GREEN}- display cheatsheet for <app-name>"
    echo "${COLOR_BLUE}  csbat <app-name> ${COLOR_GREEN}- display cheatsheet for <app-name> using bat app"
    echo "${COLOR_BLUE}  csglow <app-name> ${COLOR_GREEN}- display cheatsheet for <app-name> using glow app"
    echo "${COLOR_BLUE}  csless <app-name> ${COLOR_GREEN}- display cheatsheet for <app-name> using less app"
    echo "${COLOR_BLUE}  csl ${COLOR_GREEN}- display the list of cheat sheets that can be searched for"
}
