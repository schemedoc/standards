#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
exec </dev/null
exec >r7rs.log 2>&1
set -x
shasum -c r7rs.sha.src
extract() {
    rm -rf r7rs
    mkdir r7rs
    (cd r7rs && unzip ../r7rs-small-spec.zip)
    mv r7rs/r7rs-small-spec/* r7rs/
    rmdir r7rs/r7rs-small-spec
}
extract
(cd r7rs && make r7rs.pdf)
mv -f r7rs/r7rs.pdf output/
shasum -c r7rs.sha.dst
extract
(cd r7rs && patch -p 2 <../r7rs-errata.patch)
(cd r7rs && make r7rs.pdf)
mv -f r7rs/r7rs.pdf output/errata-corrected-r7rs.pdf
