#!/bin/bash
commitMsg=$1
remoteRep=$2
commitBranch=$3
result=$(git push $2 $3 2>&1 >/dev/null | grep fatal | cut -c1-5)

if [ "$result" == "fatal" ]; then
	echo "Remote repository not found."
	exit 1;
fi

git add *
git commit -m "$1"
git push "$2" "$3"
