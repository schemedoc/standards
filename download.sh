#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
wget -O r3rs.tar https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r3rs.tar
shasum r3rs.tar >checksum
