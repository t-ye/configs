if [ $# != 1 ] ; then
	echo 'Usage: '`basename "$0"`'<PA number>'
	exit 1 # Error!
fi

PA_NUM=$1

mkdir -p '~/pa/pa'$PA_NUM

./gethwinstructs.sh $PA_NUM
