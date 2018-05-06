if [ $# != 1 ] ; then
	echo 'Usage: gethwinstruct <PA number>'
	exit 1 # Error!
fi

PA_NUM=$1
# Parse PA_NUM here...

URL='https://cseweb.ucsd.edu/~ricko/CSE30/pa'$PA_NUM'.pdf'
echo -n 'Downloading '$URL' ... '
wget --output-document=$HOME'/pa/instructs/pa'$PA_NUM'.pdf' --quiet "$URL"
echo 'Done!'
