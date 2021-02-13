#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
#official=615ea714b19eada07a674bbfd8ddce1a995c48df
mkdir -p repo
rm -rf repo/r6rs
git clone --quiet https://github.com/schemedoc/r6rs.git repo/r6rs
cd repo/r6rs
git config --local advice.detachedHead false
prepare() {
    git reset --hard HEAD
    git checkout "$1"
    git checkout official
    patch -p 1 <../../r6rs-pre.patch
}
prepare official-with-build-fixes
git diff -R official-with-build-fixes \
    document model >../../r6rs-official.patch
prepare errata-marked
git diff -R errata-marked \
    document model >../../r6rs-errata.patch
