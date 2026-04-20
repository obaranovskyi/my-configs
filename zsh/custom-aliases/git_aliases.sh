GIT_DEFAULT_MESSAGE="Auto git push ..."

function git_push_with_message() {
  local git_message=${@:-"$GIT_DEFAULT_MESSAGE"}

	git add . &&
	git commit -a -m "$git_message" &&
	git push

	echo "Pushed to remote."
	echo "Message: $git_message"
}

alias gacp='git add . && git commit -a -m "$GIT_DEFAULT_MESSAGE" && git push';
alias gacpm='git_push_with_message';
alias gacpe='gacp && exit';

alias gsl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

git-help() {
    echo "\n${COLOR_YELLOW}  Git:";
    echo "${COLOR_BLUE}  gacp ${COLOR_GREEN}- git add, git commit, git push";
    echo "${COLOR_BLUE}  gacpm ${COLOR_GREEN}- git add, git commit, git push with the message";
    echo "${COLOR_BLUE}  gacpe ${COLOR_GREEN}- git add, git commit, git push, and close terminal";
    echo "${COLOR_BLUE}  gsl ${COLOR_GREEN}- git beautiful log";
}
