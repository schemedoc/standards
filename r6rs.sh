#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
exec </dev/null
exec >r6rs.log 2>&1
set -x
shasum -c r6rs.sha.src
extract() {
    rm -rf r6rs
    tar -xf r6rs.tar.gz
}
extract
patch -p 0 <r6rs-official.patch
(cd r6rs/document && make report LATEX=pdflatex)
mv -f r6rs/document/r6rs{,-app,-lib,-rationale}.pdf output/
extract
(cd r6rs && patch -p 1 <../r6rs-errata.patch)
(cd r6rs/document && make report LATEX=pdflatex)
for f in r6rs r6rs-app r6rs-lib r6rs-rationale; do
    mv -f r6rs/document/"$f".pdf output/errata-corrected-"$f".pdf
done
shasum -c r6rs.sha.dst
