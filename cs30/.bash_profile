# $Id: bash_profile,v 1.3 2010/07/18 21:59:26 rml Exp $
# - prototype .rc for Borne shell and its derivatives
# [ -r .acms.debug ] && echo ENTERED .bash_profile >&2
public=${public:-/public}

# All the usual setup is done by the following line.  Any additions 
# you make should come after it. 
#
# [ -r $public/bash_profile.adjunct ] && . $public/bash_profile.adjunct

# When this file was first placed in your home directory, a
# pre-existing bashrc file may have been moved to a file named 
# "${HOME}/.bashrc.old". Check the commands in that file be 
# sure they are still needed.


# You may add commands to the end of this file as needed. 
#
# CAUTION: if you choose to make adjustments to PATH,
# it is usually advisable to *add* to the existing PATH
# rather than resetting PATH completely.  By adding, there
# is less chance of inadvertently losing important elements.
# For example:  set path = ( $path ${HOME}/bin )
# [ -r .acms.debug ] && echo EXITED .bash_profile >&2
if [ -s ~/.bashrc ]; then
  source ~/.bashrc
fi

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

tmux new-session -A -s main

# tmux reopen
alias tmuxr="tmux new-session -A -s main"
