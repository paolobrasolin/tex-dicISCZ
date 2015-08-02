# First run to generate the index file and mal/style
#pdflatex main

# First we convert the *.idx encoding to UTF8
texlua iec2utf.lua < figures.idx | \
  xindy -M texindy -M mal-icelandic-min -M style -o figures.ind
# then we pipe the result to xindy that sets it with our modules

# Standard bibliography compilation
#biber main

# Finishing runs
#pdflatex main
#pdflatex main

