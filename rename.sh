mkdir introduction

mv dictionary_historie.tex     introduction/historie.tex
mv dictionary_instructions.tex introduction/instructions.tex
mv dictionary_uvod.tex         introduction/uvod.tex
mv letters/zkratky.tex         introduction/zkratky.tex
mv letters/zkratky_is.tex      introduction/zkratky_is.tex

mkdir morpho

mv letters/dictionary_classes_* morpho/
cd morpho
rename 's/dictionary_classes_(.*)/$1/' *
cd ..

mkdir phon

mv latex_consonants.tex phon/consonants.tex
mv latex_vowels.tex     phon/vowels.tex
mv list_of_phonems.tex  phon/phonems.tex

mv bb8.pdf photo_icon.pdf

