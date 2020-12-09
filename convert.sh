#!/bin/sh
set -eu
exec </dev/null 2>&1
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
command -V dvipdf
command -V latex209
command -V shasum
test -f r3rs.tar
shasum -c checksum
mkdir -p r3rs
find r3rs -mindepth 1 -delete
cd r3rs
tar -xf ../r3rs.tar
! test -e r3rs.toc
latex209 r3rs.tex
test -s r3rs.toc
latex209 r3rs.tex
test -s r3rs.dvi
dvipdf r3rs.dvi
test -s r3rs.pdf
mv -fv r3rs.dvi r3rs.log r3rs.pdf ../
cd ..
rm -rfv r3rs
