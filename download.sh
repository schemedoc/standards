#!/bin/sh
set -eu
fetch="curl --location --fail --silent --show-error -o"
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
$fetch r3rs.tar https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r3rs.tar
$fetch r4rs.tar https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r4rs.tar
$fetch r5rs.tar https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs.tar
$fetch r6rs.tar.gz http://www.r6rs.org/final/r6rs.tar.gz
$fetch r7rs-small-spec.zip https://small.r7rs.org/attachment/r7rs-small-spec.zip
