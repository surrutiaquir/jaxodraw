FILE=$1

# (1) latex -> dvi
sed -i '' -e "s/\\\fcolorbox{white}{white}/{}/" "$FILE.tex"
latex "$FILE.tex"

# (2) dvi -> ps
dvips "$FILE.dvi"

# (3) ps -> pdf
ps2pdf "$FILE.ps"

# (4) crop
pdfcrop --ini "$FILE.pdf" "$FILE.pdf"

# (5) clean
rm -rf *.aux *.log *.out *.blg *.dvi *.rel *.ps *.eps 
