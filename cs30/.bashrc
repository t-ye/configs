# /public/bashrc -- prototype for ${HOME}/.bashrc
# $Id: bashrc,v 1.2 2010/07/18 21:57:59 rml Exp $
# [ -r .acms.debug ] && echo ENTERED .bashrc >&2
public=${public:-/public}

# Your .bashrc file is processed each time a new, non-login
# Bourne-Again SHell (bash) is initialized.
# Changes made here will have no effect on the login bash shell;
# such changes should be made in .bash_profile.
#
# All the usual setup is done by the following line.  Any additions
# you make should come after it.
#
# You may add commands to the end of this file as needed.
#

# echo processing bash specific shell initialization
# [ -r $public/bashrc.adjunct ] && . $public/bashrc.adjunct

# When this file was first placed in your home directory, a
# pre-existing bashrc file may have been moved to a file named
# "${HOME}/.bashrc.old". Check the commands in that file be
# sure they are still needed.

if [ -r ${HOME}/.bashrc.old ]
then
	echo "----------------------------------------------"
	echo "About to run commands in your old bashrc file."
	echo "Delete the file .bashrc.old, or edit .bashrc if these commands"
	echo "should not be run anymore."
	echo "----------------------------------------------"
	source ${HOME}/.bashrc.old
	echo "----------------------------------------------"
	echo "Done running commands in your old bashrc file."
	echo "----------------------------------------------"
fi


# https://superuser.com/questions/690735/can-i-tell-if-im-in-an-scp-session-in-my-bashrc
if [ -z "$PS1" ]; then
	return
fi

# CAUTION: if you choose to make adjustments to PATH,
# it is usually advisable to *add* to the existing PATH
# rather than resetting PATH completely.  By adding, there
# is less chance of inadvertently losing important elements.
# For example:  set path = ( $path ${HOME}/bin )
# [ -r .acms.debug ] && echo EXITING .bashrc >&2

# tmux reopen

# LS_COLORS=$LS_COLORS:'di=1;96:ln=4;96:ex=1;95:mi=1;31:*.c=93:*.s=92:*.h=91' ; export LS_COLORS
# alias tmuxr="tmux new-session -A -s main"

alias tmux='tmux attach -d'
export CURRENT_PA=3
if [[ $HOSTNAME != pi* ]]; then

	if ! { [ "$TERM" = "screen" ] || [ -n "$TMUX" ]; } then
		tmux
	else
		# -r: backslash read literally
		# -p: prompt
		# -n1: read only one character (including newline)
		redirect="pi-cluster.ucsd.edu"
		read -t1 -n1 -r -p "ssh into ${redirect}? (Y/n): " response
		echo
		response=${response,,} # tolower
		if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
		   ssh $redirect
		fi
	fi
fi


cd ~/pa/pa${CURRENT_PA}
if [ -a aliases ]; then
	source aliases
fi


alias sshpi="ssh pi-cluster.ucsd.edu"
export PATH=$PATH":~/bin"

alias ls="ls --color=auto"

LS_COLORS=$LS_COLORS:'di=1;96:ln=4;96:ex=1;95:mi=1;31:*.c=93:*.s=92:*.h=91' ; export LS_COLORS
#LS_COLORS=$LS_COLORS:'di=1;34:ln=4;34:ex=1;35:mi=1;31:*.c=33:*.s=32:*.h=31' ; export LS_COLORS

export PS1="\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;83m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;81m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;226m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
# export PS1="\[\e[31m\]\u\[\e[m\] \[\e[32m\]\h\[\e[m\] \[\e[34m\]\W\[\e[m\] \[\e[35m\]\\$\[\e[m\] "

# Don't autocomplete on object files.
EXECIGNORE=*.o

# Don't save repetitions in command history.
export HISTCONTROL=ignoredups


export PA_BASEDIR="${HOME}/pa"
export INSTRUCTS_DIR="${PA_BASEDIR}/instructs"
export IENG6='ieng6.ucsd.edu'

# Disable C-s from freezing the terminal.
bind -r '\C-s'
stty -ixon
