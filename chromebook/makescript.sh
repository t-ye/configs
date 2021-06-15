while /bin/true; do
	#if [ -f "$(pwdx $1)/Makefile" ]; then
	OUTPUT=$(make -C $(cut -d " " -f2 <<< $(pwdx $1)) --no-print-directory)
	# reset
	echo -e '\0033\0143'	
	echo "${OUTPUT}"
	#else 
	#	make -f '~/ucsd-math/Makefile' -C $(cut -d " " -f2 <<< $(pwdx $1)) --no-print-directory
	#fi

	sleep 1
done
# wine ~/SumatraPDF-3.2-64.exe "$(cut -d " " -f2 <<< $(pwdx $1))/main.pdf" &
