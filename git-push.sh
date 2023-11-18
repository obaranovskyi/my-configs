#!/bin/sh

if [ -z "$@" ]
then
	GIT_MESSAGE="=== Auto git push: Config update ==="
else
	GIT_MESSAGE=$@
fi

git add . &&
git commit -a -m "$GIT_MESSAGE" &&
git push
echo "Pushed to remote. Message: $GIT_MESSAGE"
