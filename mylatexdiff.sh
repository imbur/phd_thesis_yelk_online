#!/bin/bash
TMPDIR=$(mktemp -d /tmp/git-latexdiff.XXXXXX)
FM=thesis_phd.tex
FMPDF=thesis_phd.pdf

MATHOPT="--math-markup=0"
# --config="PICTUREENV=(?:picture|DIFnomarkup|align)[\w\d*@]*"

filename="*tex"
for file in $filename
do
    echo $file
    latexdiff $MATHOPT "$1/$file" "$file" > $TMPDIR/$file
done

filename="*bib"
for file in $filename
do
    echo $file
    latexdiff "$1/$file" "$file" > $TMPDIR/$file
done

filename="*bbl"
for file in $filename
do
    echo $file
    latexdiff "$1/$file" "$file" > $TMPDIR/$file
done

pdflatex -interaction nonstopmode -output-directory $TMPDIR $TMPDIR/$FM
cd $TMPDIR
bibtex $FM
cd -
pdflatex -interaction nonstopmode -output-directory $TMPDIR $TMPDIR/$FM
pdflatex -interaction nonstopmode -output-directory $TMPDIR $TMPDIR/$FM

cp $TMPDIR/$FMPDF diff.pdf
rm -rf $TMPDIR
evince diff.pdf&
