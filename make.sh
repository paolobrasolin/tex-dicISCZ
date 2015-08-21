# Vlna - to add unbreakable spaces in front of the one syllable Czech prepositions
# http://ftp.linux.cz/pub/tex/local/cstug/olsak/vlna/
#vlna -l -m -n introduction/uvod.tex
#vlna -l -m -n introduction/historie.tex
#vlna -l -m -n introduction/instructions.tex
#vlna -l -m -n letters.tex

# First run to generate the index file and mal/style
xelatex main

# First we convert the *.idx encoding to UTF8
texlua iec2utf.lua < figures.idx | \
  xindy -M texindy -M mal-icelandic-min -M style -o figures.ind
# then we pipe the result to xindy that sets it with our modules

# Standard bibliography compilation
#biber main

# Finishing runs
#xelatex main
#xelatex main

