# First run to generate the index file and mal/style
pdflatex main

# We convert its encoding to UTF8 using github.com/michal-h21/iec2utf
texlua iec2utf.lua < main.idx > main-utf8.idx
# We produce the sorted index using the module by Malipivo
xindy -M texindy -M mal-icelandic-min -M mal-style -o main.ind main-utf8.idx

# Standard bibliography compilation
biber main

# Finishing runs
pdflatex main
pdflatex main

