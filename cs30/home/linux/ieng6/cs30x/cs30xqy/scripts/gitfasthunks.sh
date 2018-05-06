#!/bin/bash

# Don't let this script continue if an error pops up.
set -e

read -p "Enter the file name to repeatedly stage in hunks & commit: "
FILENAME=$REPLY

while true ; do

	git add --patch "$FILENAME"
	read -p "Enter a commit message: "
	COMMITMSG=$REPLY

	git commit -m "$COMMITMSG"
done
