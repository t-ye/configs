if [ $# != 1 ] ; then
	echo 'Usage: '`basename "$0"`'<PA number>'
	exit 1 # Error!
fi

PA_NUM=$1

if ! [[ $PA_NUM =~ ^[0-9]+$ ]] ; then
	echo "Argument not a number!"
	exit 1 # Error!
fi

PA="pa${PA_NUM}"
PA_DIR="${PA_BASEDIR}/${PA}"
SYMLINK='ln --symbolic --force'
getpainstructs "$PA_NUM"

echo -n 'Creating PA directory... '
mkdir --parents "$PA_DIR"
echo 'Done.'

echo -n 'Copying starter files over... '
cp --recursive "${HOME}/../public/${PA}StarterFiles/"* "${PA_DIR}"
echo 'Done.'

echo -n 'Creating symlinks... '
$SYMLINK "${PA_DIR}" "${HOME}/${PA}"
$SYMLINK "${INSTRUCTS_DIR}/${PA}.txt" "${PA_DIR}/${PA}.txt"
$SYMLINK "${HOME}/../public/${PA}test" solution
echo 'Done.'
