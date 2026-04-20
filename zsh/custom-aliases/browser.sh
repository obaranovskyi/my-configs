habitica="https://habitica.com"
habitify="https://www.habitify.me/"
chatgpt="https://chat.openai.com"
outlook="https://outlook.office365.com/mail"
monkeytype="https://monkeytype.com"

urls_to_open=(
  $habitica
  $habitify
  $chatgpt
  $outlook
  $monkeytype
)

function ffwt() {
  # OSX
  if [[ $(uname -s) == "Darwin" ]]; then
    open -a Firefox 
    for url in $urls_to_open
    do
      open -a Firefox $url
    done
  fi

  if [[ $(uname -s) == "Linux" ]]; then
    # Under construction
  fi
}


browser-help() {
    echo "\n${COLOR_YELLOW}  Browser:";
    echo "${COLOR_BLUE}  ffwt - ${COLOR_GREEN}- open browser with predefined urls";
}
