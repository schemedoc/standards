#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
exec </dev/null
exec >r4rs.log 2>&1
set -x
shasum -c r4rs.sha.src
rm -rf r4rs
mkdir r4rs
(cd r4rs && tar -xf ../r4rs.tar)
(cd r4rs && latex209 r4rs.tex)
test -s r4rs/r4rs.toc
(cd r4rs && latex209 r4rs.tex)
test -s r4rs/r4rs.dvi
(cd r4rs && dvipdf r4rs.dvi)
test -s r4rs/r4rs.pdf
(cd r4rs && dvips r4rs.dvi)
test -s r4rs/r4rs.ps
mv -i r4rs/r4rs.pdf output/
shasum -c r4rs.sha.dst
