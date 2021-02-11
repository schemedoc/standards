#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
exec </dev/null
exec >r7rs.log 2>&1
set -x
shasum -c r7rs.sha.src
rm -rf r7rs
mkdir r7rs
(cd r7rs && unzip ../r7rs-small-spec.zip)
mv r7rs/r7rs-small-spec/* r7rs/
rmdir r7rs/r7rs-small-spec
cp r7rs/r7rs.tex r7rs/r7rs.tex.orig
(cd r7rs && make r7rs.pdf)
mv -i r7rs/r7rs.pdf output/
shasum -c r7rs.sha.dst
