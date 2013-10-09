
for file in *.pdf
do
    gs -dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sDEVICE=pdfwrite\
    -sPAPERSIZE=letter -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer\
    -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true\
    -dEmbedAllFonts=true -sOutputFile=processed/"$file" -f "$file"
done
