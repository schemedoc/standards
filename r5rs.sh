#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
exec </dev/null
exec >r5rs.log 2>&1
set -x
shasum -c r5rs.sha.src
rm -rf r5rs
tar -xf r5rs.tar
cp r5rs/r5rs.tex r5rs/r5rs.tex.orig
patch -p 0 <r5rs-official.patch
(cd r5rs && latex r5rs.tex)
(cd r5rs && latex r5rs.tex)
(cd r5rs && pdflatex r5rs.tex)
(cd r5rs && dvips r5rs.dvi)
mv -i r5rs/r5rs.pdf output/
shasum -c r5rs.sha.dst
