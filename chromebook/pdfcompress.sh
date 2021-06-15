# Usage: pdfcompress <PDF name without .pdf>
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile="$1c.pdf" "$1.pdf"
