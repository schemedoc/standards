#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
exec </dev/null
exec >r6rs.log 2>&1
set -x
shasum -c r6rs.sha.src
rm -rf r6rs
tar -xf r6rs.tar.gz
patch -p 0 <r6rs-official.patch
(cd r6rs/document && make report LATEX=pdflatex)
mv -i r6rs/document/r6rs{,-app,-lib,-rationale}.pdf output/
shasum -c r6rs.sha.dst
