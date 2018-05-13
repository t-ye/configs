#!/bin/bash
# "Remote do" - run commands on the ieng6 server, which
# is better furnished with commands.
TODO=$1
if [[ $HOSTNAME == ieng6* ]] ; then
	$TODO
else
	ssh "$IENG6" 'echo n ; '"$TODO"
fi
