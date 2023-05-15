habitica="https://habitica.com/"
habitify="https://www.habitify.me/"
chatgpt="https://chat.openai.com/"
outlook="https://outlook.office365.com/mail/"
monkeytype="https://monkeytype.com/"

urls_to_open="$habitica $habitify $chatgpt $outlook $monkeytype"


function fo() {
  if [[ $(uname -s) == "Darwin" ]]; then
    open -a /Applications/Firefox.app -g urls_to_open
  fi

  if [[ $(uname -s) == "Linux" ]]; then
    # Under construction
  fi
}


browser-help() {
    echo "\n${COLOR_YELLOW}  Browser:";
    echo "${COLOR_BLUE}  fo ${COLOR_GREEN}- open browser with predefined urls";
}
