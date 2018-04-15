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

# CAUTION: if you choose to make adjustments to PATH,
# it is usually advisable to *add* to the existing PATH
# rather than resetting PATH completely.  By adding, there
# is less chance of inadvertently losing important elements.
# For example:  set path = ( $path ${HOME}/bin )
# [ -r .acms.debug ] && echo EXITING .bashrc >&2

export CURRENT_PA=1
if [[ $HOSTNAME != pi* ]]; then
	redirect="pi-cluster.ucsd.edu"
	read -r -p "ssh into ${redirect}? (Y/n): " response
	response=${response,,} # tolower
	if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
	   ssh $redirect
	fi
fi

cd ~/pa/pa${CURRENT_PA}

alias sshpi="ssh pi-cluster.ucsd.edu"
alias backup="~/backup.sh"

alias ls="ls --color=auto"

export PS1="\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;83m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;81m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;226m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

if [[ $HOSTNAME != pi* ]]; then
	tmux new-session -A -s main
fi

# tmux reopen
alias tmuxr="tmux new-session -A -s main"
