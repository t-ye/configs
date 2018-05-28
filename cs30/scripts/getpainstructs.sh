if [[ $# != 1 ]] ; then
	echo "Usage: $0 <PA number>"
	exit 1 # Error!
fi

PA_NUM=$1
# Parse PA_NUM here...
if ! [[ $PA_NUM =~ ^[0-9]+$ ]] ; then
	echo "Argument not a number!"
	exit 1 # Error!
fi

URL="https://cseweb.ucsd.edu/~ricko/CSE30/pa${PA_NUM}.pdf"
PDF_PATH="${INSTRUCTS_DIR}/pa${PA_NUM}.pdf" # INSTRUCTS_DIR needs to be set!



echo -n "Downloading PDF... "
wget --output-document="$PDF_PATH" --quiet "$URL"
echo 'Done.'

: '
echo -n 'Converting to .txt... '
remdo 'pdftotext -layout '"$PDF_PATH"
echo 'Done. '

echo -n 'Removing PDF file... '
rm "$PDF_PATH"
echo 'Done.'
'
