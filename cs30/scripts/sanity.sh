# Sanity checks for style grade.
grep --regexp=TODO --no-messages --binary-files=without-match \
     --exclude='*.o' --exclude='tags' --exclude='*.txt' *
grep --regexp='.\{81\}' --no-messages --binary-files=without-match \
     --exclude='*.o' --exclude='tags' --exclude='*.txt' *
