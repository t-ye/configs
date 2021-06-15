while /bin/true; do
	#if [ -f "$(pwdx $1)/Makefile" ]; then
	cd $(cut -d " " -f2 <<< $(pwdx $1))
	cd $(git rev-parse --show-toplevel)
	#git -C $(cut -d " " -f2 <<< $(pwdx $1)) add -A
	#git -C $(cut -d " " -f2 <<< $(pwdx $1)) commit -m "."
	#git -C $(cut -d " " -f2 <<< $(pwdx $1)) clean -xf
	git add -A
	git commit -m "."
	#git rm --cached `git ls-files -i --exclude-from=.gitignore`
	#git clean -xdf
	sleep 60
done
# wine ~/SumatraPDF-3.2-64.exe "$(cut -d " " -f2 <<< $(pwdx $1))/main.pdf" &
