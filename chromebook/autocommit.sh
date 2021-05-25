while /bin/true; do
	#if [ -f "$(pwdx $1)/Makefile" ]; then
	git -C $(cut -d " " -f2 <<< $(pwdx $1)) add -A
	git -C $(cut -d " " -f2 <<< $(pwdx $1)) commit -m "."
	git -C $(cut -d " " -f2 <<< $(pwdx $1)) clean -xf
	sleep 600
done
# wine ~/SumatraPDF-3.2-64.exe "$(cut -d " " -f2 <<< $(pwdx $1))/main.pdf" &
