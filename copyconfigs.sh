CONFIG_ACCOUNT=$1

# $0 - path to call the script
# %/* - match the last occurence of / and remove anything (*)
# after it
SCRIPT_PATH="${0%/*}"

cd $SCRIPT_PATH
while read config_file ; do
	cp ~/$config_file $CONFIG_ACCOUNT/$config_file
done <$CONFIG_ACCOUNT/config_list


