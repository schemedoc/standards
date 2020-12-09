#!/bin/sh
set -eu
exec </dev/null 2>&1
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
command -V dvipdf
command -V latex209
command -V shasum
shasum -c checksum
test -f r3rs.tar
mkdir -p r3rs
find r3rs -mindepth 1 -delete
cd r3rs
tar -xf ../r3rs.tar
latex209 r3rs.tex
test -s r3rs.dvi
dvipdf r3rs.dvi
test -s r3rs.pdf
mv -f r3rs.dvi r3rs.pdf ../
