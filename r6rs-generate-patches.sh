#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
mkdir -p repo
rm -rf repo/r6rs
git clone --quiet https://github.com/schemedoc/r6rs.git repo/r6rs
cd repo/r6rs
git checkout errata-marked
git checkout -b official 615ea714b19eada07a674bbfd8ddce1a995c48df
patch -p 1 <../../r6rs-pre.patch
git diff -R errata-marked document model >../../r6rs-errata.patch.new
mv -f ../../r6rs-errata.patch.new ../../r6rs-errata.patch
