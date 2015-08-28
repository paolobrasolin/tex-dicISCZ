# Vlna - to add unbreakable spaces in front of the one syllable Czech prepositions
# http://ftp.linux.cz/pub/tex/local/cstug/olsak/vlna/
# vlna -l -m -n -v KkSsVvZzOoUuAaIi introduction/uvod.tex
# vlna -l -m -n -v KkSsVvZzOoUuAaIi introduction/historie.tex
# vlna -l -m -n -v KkSsVvZzOoUuAaIi introduction/instructions.tex
# vlna -l -m -n -v KkSsVvZzOoUuAaIi letters.tex

mkdir tmp

# First run needs to run xindy
xelatex --shell-escape --output-dir=tmp main.tex

# First we convert the *.idx encoding to UTF8
#texlua iec2utf.lua < figures.idx | \
#  xindy -M texindy -M mal-icelandic-min -M style -o figures.ind
# then we pipe the result to xindy that sets it with our modules

# Standard bibliography compilation
#biber --input-dir=tmp --output-dir=tmp main

# Finishing runs
#xelatex --output-dir=tmp main.tex
#xelatex main

mv tmp/main.pdf ./

