#!/bin/bash

# References:
# https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html
# https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html
# http://mywiki.wooledge.org/BashFAQ/031 (double vs single brackets)
# https://stackoverflow.com/questions/23442173/bash-reading-from-a-file-to-an-associative-array

# Stop this script when an error occurs.
# Unfortunately, this will fsck up b/c of sdiff, which indicates differences
# partly by setting $? (error code).
# set -e

NUM_ARGS="$#"
NUM_ARGS_NEEDED=4
if [ $NUM_ARGS -ne $NUM_ARGS_NEEDED ]; then
	echo 'Usage: '$(basename "$0")' <make-target> <solution> <driver> <argument-src-file>'
	exit 1
fi

# Name the arguments
MAKE_TARGET="$1"
SOLUTION="$2"
DRIVER="$3"
ARGUMENTS="$4"

oldIFS=${IFS}
IFS=" "

declare -A testcases
while read -a array
do
  testcases["${array[0]}"]="${array[@]:1}"
done < "$ARGUMENTS"

#for key in ${!testcases[@]}
#do
#  echo "${key} ---> ${assoc[${key}]}"
#done

IFS=${oldIFS}

# Constants - files
DIFFERENCES_FILE='DIFFERENCES_FILE'
SOLUTION_OUT_FILE='SOLUTION_OUT'
SOLUTION_ERR_FILE='SOLUTION_ERR'
DRIVER_OUT_FILE='DRIVER_OUT'
DRIVER_ERR_FILE='DRIVER_ERR'
TERMINAL_FILE_STREAM='/dev/tty'

# Constants - terminal messages
STDOUT_LABEL='STDOUT: '
STDERR_LABEL='STDERR: '

START_COMPILE_MSG='Compiling (make '"$MAKE_TARGET"')...'
ERR_COMPILE_MSG='Compilation failed.'
FINISH_COMPILE_MSG='Compilation succesful!'


# Command aliases
# Ignore differences when file name is outputted.
SDIFF='sdiff --text'" --ignore-matching-lines=$SOLUTION\|$DRIVER"
SDIFF_DIFFS_ONLY="$SDIFF"' --suppress-common-lines'
# SED='sed --in-place'
DIFF='diff --text --context'" --ignore-matching-lines=$SOLUTION\|$DRIVER \
      --side-by-side"
MAKE='make --silent'

print() { # print without newline
	echo -n $@
}

errcho() { # echo to stderr
	>&2 echo $@
}


rm -f "$DIFFERENCES_FILE"

echo "$START_COMPILE_MSG"
# &> file equivalent to > file 2> file or >file 2>&1
$MAKE "$MAKE_TARGET" &> /dev/null
if [ $? -ne 0 ]; then
	errcho "$ERR_COMPILE_MSG"
	exit 1
fi
echo "$FINISH_COMPILE_MSG"
echo

# echo "$SDIFF_DIFFS_ONLY"

# START TESTS
for type in ${!testcases[@]} ; do

	# reset print color to white
	tput setaf 7
# quoting keeps things together,
# whereas not quoting allows strings to act as multiple parameters
	TESTCASE="$type (${testcases[$type]})"
	ARGS=${testcases["$type"]}

	print "$TESTCASE"
# 2>&1 : redirect stderr to where stdout is pointing to *now*. Redirecting
# stdout before 2>&1 will affect stderr, redircting stdout after will not.
# &: run in background (allow next command to run)
# wait: wait for background processes to finish
	$SOLUTION $ARGS  > "$SOLUTION_OUT_FILE" \
	                2> "$SOLUTION_ERR_FILE" &
	$DRIVER   $ARGS  > "$DRIVER_OUT_FILE" \
	                2> "$DRIVER_ERR_FILE" &
	wait



# Command substitution: redirect output of command to script.

	DIFF=0
	STDOUT_DIFFS=$($SDIFF_DIFFS_ONLY "$SOLUTION_OUT_FILE" "$DRIVER_OUT_FILE" 2>&1)
	# $SDIFF_DIFFS_ONLY "$SOLUTION_OUT_FILE" "$DRIVER_OUT_FILE"
	if [[ $STDOUT_DIFFS ]]; then
		# echo "$STDOUT_LABEL"
		# echo "$STDOUT_DIFFS"
		DIFF=1
	fi

	STDERR_DIFFS=$($SDIFF_DIFFS_ONLY "$SOLUTION_ERR_FILE" "$DRIVER_ERR_FILE" 2>&1)
	if [[ $STDERR_DIFFS ]]; then
		# echo "$STDERR_LABEL"
		# echo "$STDERR_DIFFS"
		DIFF=1
	fi

	# $? indicates error (for sdiff, that files were different)
	# ERROR=$?

	#echo "$STDERR_LABEL" # Diff stderr
	# $SDIFF_DIFFS_ONLY "$SOLUTION_ERR_FILE" "$DRIVER_ERR_FILE"
	# ERROR=$(($ERROR + $?)) # Add to to current error
	# echo


	# If files were different, save the differences
	if [[ $DIFF -ne 0 ]] ; then
		echo "$(tput setaf 1) FAILED!"
		# start writing everything to file
		exec &>>"$DIFFERENCES_FILE"

		echo "$TESTCASE"

		echo "$STDOUT_LABEL" # Diff stdout
		$DIFF "$SOLUTION_OUT_FILE" "$DRIVER_OUT_FILE"

		echo "$STDERR_LABEL" # Diff stderr
		$DIFF "$SOLUTION_ERR_FILE" "$DRIVER_ERR_FILE"

		# echo

		# start writing everything to terminal again
		exec &>"$TERMINAL_FILE_STREAM"
		# tput setaf <RGB>
	else
		echo "$(tput setaf 2) PASSED!"
	fi
	# reset print color to white
	tput setaf 7
done


# echo
# echo '(if they differ: left is public tester, right is your output)'
