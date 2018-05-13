#!/bin/bash

# https://stackoverflow.com/questions/2423777/

# https://gist.github.com/robwierzbowski/5430952/
# Create and push to a new github repo from the command line.
# Grabs sensible defaults from the containing folder and `.gitconfig`.
# Refinements welcome.

git init
# Gather constant vars
CURRENTDIR=${PWD##*/}
GITHUBUSER=$(git config github.user)

# Get user input
read -p "Repository name (default ${PWD##*/}): " REPONAME
read -p "Username (default ${GITHUBUSER}): " GITHUBUSER
read -p "Repository description: " DESCRIPTION

if [[ -z $REPONAME ]]; then
	REPONAME=${PWD##*/}
fi

if [[ -z $GITHUBUSER ]]; then
	GITHUBUSER=$(git config github.user)
fi

echo
echo "Here we go..."
echo

# Curl some json to the github API oh damn we so fancy
curl -u ${GITHUBUSER} https://api.github.com/user/repos \
	-d "{\"name\": \"${REPONAME:-${CURRENTDIR}}\",
	     \"description\": \"${DESCRIPTION}\",
	     \"private\": true,
	     \"has_issues\": true,
	     \"has_downloads\": true,
	     \"has_wiki\": false}" 2> ~/makerepo_errs

# Set the freshly created repo to the origin and push
# You'll need to have added your public key to your github account
# git remote add origin git@github.com:${GITHUBUSER}/${REPONAME:-${CURRENTDIR}}.git
git remote set-url origin git@github.com:${GITHUBUSER}/${REPONAME:-${CURRENTDIR}}.git
# git remote set-url origin git@github.com:${USER:-${GITHUBUSER}}/${REPONAME:-${CURRENTDIR}}.git
# git push --set-upstream origin master
