cd ~/pa
echo -n 'Cleaning... '
make clean &> /dev/null
echo 'Done. '
# Make backups of PAs.

FILENAME=~/backup.tar.gz
tar --exclude='*.o' --exclude='.*' -zcf $FILENAME "${PA_BASEDIR}" --exclude=${INSTRUCTS_DIR}


remdo "echo '' | mail -a $FILENAME -s '' thye@ucsd.edu"

rm "$FILENAME"
