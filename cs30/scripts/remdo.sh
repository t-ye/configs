#!/bin/bash
# "Remote do" - run commands on the ieng6 server, which
# is better furnished with commands.
TODO=$1
if [[ $HOSTNAME == ieng6* ]] ; then
	bash -c $TODO
else
	ssh "$IENG6" 'echo n ; cd '"$PWD ; ""$TODO"
fi
