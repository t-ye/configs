FILENAME=backup.tar.gz
tar -zcf $FILENAME ~/pa --exclude=pa/instructs
echo "" | mail -a $FILENAME -s "cs30 backup" thye@ucsd.edu
