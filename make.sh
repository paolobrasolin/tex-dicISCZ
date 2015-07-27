#!/bin/bash
#cd Dokumenty/hvalur.org/tmp/
#vlna -l -m -n dictionary_uvod.tex
#vlna -l -m -n dictionary_historie.tex
#vlna -l -m -n dictionary_instructions.tex
#cd letters/
#vlna -l -m -n dictionary.tex
#cd ..
#pdflatex dict_main.tex
#pdflatex dict_main.tex
##texlua utftexindy.lua -L icelandic dict_main.idx
##makeindex dict_main
#texlua iec2utf.lua <dict_main.idx | xindy -C utf8 -L icelandic -M texindy -o dict_main.ind
##xindy -M texindy -M icelandicmal-test -M mal-style  dict_main.idx
##texindy -L icelandic -M lang/icelandic/utf8 dict_main.idx
##xindy -M texindy -C utf8 -L icelandic dict_main.idx
#pdflatex dict_main.tex

pdflatex main
texlua iec2utf.lua < main.idx > mal-temp.idx
xindy -M texindy -M icelandicmalmin -M mal-style -o main.ind mal-temp.idx
biber main
pdflatex main
pdflatex main

