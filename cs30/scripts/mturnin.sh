# Milestone turnin script.

if [[ $# -ne 1 ]] ; then
	echo 'Usage: '$(basename "$0")' <pa-number>'
	exit 1
fi

PA_NUM=$1

~/../public/bin/cse30_pa${PA_NUM}milestone_turnin < ~/scripts/turninmsg
