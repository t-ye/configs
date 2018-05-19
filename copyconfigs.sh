if [ $# != 1 ] ; then
	echo "Usage: copyconfigs.sh <account name>"
	exit 1
fi

CONFIG_ACCOUNT=$1

# $0 - path to call the script
# %/* - match the last occurence of / and remove anything (*)
# after it
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
# Add files relative to the script's directory

# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPT_PATH=`dirname $SCRIPT`

# Set the working directory of this script
# to the script's location
cd $SCRIPT_PATH

# Make the directory if it isn't already there
mkdir --parents $CONFIG_ACCOUNT

# If config list doesn't exist
if [ ! -e $CONFIG_ACCOUNT/config_list ] ; then
	echo "Config list not found for $CONFIG_ACCOUNT."
	read -p "Create a config list for $CONFIG_ACCOUNT? (Y/n) " -n 1 -r
	echo

	if ! [[ "$REPLY" =~ ^(Y|y)$ ]] ; then
		echo "Exiting."
		exit 0
	fi
	touch $CONFIG_ACCOUNT/config_list
fi

# Check file size
if [ ! -s $CONFIG_ACCOUNT/config_list ] ; then
	echo "Config list for $CONFIG_ACCOUNT empty."
	echo "Redirecting stdin to $CONFIG_ACCOUNT/config_list (C-D to stop)"
	cat >> $CONFIG_ACCOUNT/config_list
fi


# Copy the files!
# Preserve the directory structure as indicated in config_file.
while read config_file ; do
	cp --parents --recursive ~/$config_file $CONFIG_ACCOUNT/
	if [ -d ~/$config_file ]; then
		mkdir --parents $CONFIG_ACCOUNT/$config_file/
		rm --recursive --force $CONFIG_ACCOUNT/$config_file
	fi
	mv $CONFIG_ACCOUNT/$HOME/$config_file \
	   $CONFIG_ACCOUNT/$config_file
done <$CONFIG_ACCOUNT/config_list

rm --recursive --dir $CONFIG_ACCOUNT/home


if [[ $HOSTNAME == pi* ]]; then
	ssh ieng6.ucsd.edu "cd $SCRIPT_PATH; git fpush"
else
	:
	git fpush < /dev/null
fi

