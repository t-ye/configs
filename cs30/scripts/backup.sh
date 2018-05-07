cd ~/pa
make clean

FILENAME=~/backup.tar.gz
tar --exclude='*.o' --exclude='.*' -zcf $FILENAME ~/pa --exclude=pa/instructs

if [[ $HOSTNAME == pi* ]]; then
	ssh ieng6.ucsd.edu "echo n ; \
	                    echo '' | mail -a $FILENAME -s '' thye@ucsd.edu; \
	                    scp $FILENAME lightningleaf@sdf.lonestar.org:~/cs30/"
else
    echo '' | mail -a $FILENAME -s '' thye@ucsd.edu
    scp $FILENAME lightningleaf@sdf.lonestar.org:~/cs30/
fi

rm -f $FILENAME
