#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
exec </dev/null
exec >r3rs.log 2>&1
set -x
shasum -c r3rs.sha.src
rm -rf r3rs
mkdir r3rs
(cd r3rs && tar -xf ../r3rs.tar)
(cd r3rs && latex209 r3rs.tex)
test -s r3rs/r3rs.toc
(cd r3rs && latex209 r3rs.tex)
test -s r3rs/r3rs.dvi
(cd r3rs && dvipdf r3rs.dvi)
test -s r3rs/r3rs.pdf
(cd r3rs && dvips r3rs.dvi)
test -s r3rs/r3rs.ps
mv -f r3rs/r3rs.pdf output/
shasum -c r3rs.sha.dst
