alias py='python ';

alias cmd="cmdcheatsheet"
alias tm="cmdtaskmanager"
alias ea="cmdenglishassist"
alias ytd="cmdytd"
alias na="py ${PYTHON_SCRIPTS_PATH}/nato-alphabet/main.py"

alias socket-chat-server="python3 ${PYTHON_SCRIPTS_PATH}/socket-chat/server.py"
alias socket-chat-client="python3 ${PYTHON_SCRIPTS_PATH}/socket-chat/client.py"
alias scs="socket-chat-server"
alias scc="socket-chat-client"

function python-help() {
    echo "\n${COLOR_YELLOW}  Python:";
    echo "${COLOR_BLUE}  na <value> ${COLOR_GREEN}- will show words for every character in a word";
    echo "${COLOR_BLUE}  cmd -h ${COLOR_GREEN}- show a list of commands that might be used with 'cmdcheatsheet' program"
    echo "${COLOR_BLUE}  tm -h ${COLOR_GREEN}- show a list of commands that might be used with 'cmdtaskmanger' program"
    echo "${COLOR_BLUE}  ea -h ${COLOR_GREEN}- show a list of commands that might be used with 'cmdenglishassist' program"
    echo "${COLOR_BLUE}  ytd -h ${COLOR_GREEN}- Show download youtube program help"
    echo "${COLOR_BLUE}  socket-chat-server[scs] 192.168.0.103:5050 ${COLOR_GREEN}- Start tcp socket server at pc with ip 192.168.0.103"
    echo "${COLOR_BLUE}  socket-chat-client[scc] 192.168.0.103:5050 ${COLOR_GREEN}- Connect to server which started on PC with ip 192.168.0.103"
}
