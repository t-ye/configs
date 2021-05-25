while /bin/true; do
	#if [ -f "$(pwdx $1)/Makefile" ]; then
	make -C $(cut -d " " -f2 <<< $(pwdx $1)) --no-print-directory
	#else 
	#	make -f '~/ucsd-math/Makefile' -C $(cut -d " " -f2 <<< $(pwdx $1)) --no-print-directory
	#fi

	sleep 1
done
# wine ~/SumatraPDF-3.2-64.exe "$(cut -d " " -f2 <<< $(pwdx $1))/main.pdf" &
