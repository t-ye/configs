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

cd $SCRIPT_PATH

# Make the directory if it isn't already there
mkdir -p $CONFIG_ACCOUNT

while read config_file ; do
	cp -r ~/$config_file $CONFIG_ACCOUNT/$config_file
done <$CONFIG_ACCOUNT/config_list

git fpush
