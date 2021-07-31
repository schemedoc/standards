#!/bin/sh
set -eu
cd "$(dirname "$0")"
set -x
rsync -crv output/r*rs*.pdf \
    alpha.servers.scheme.org:/production/standards/www/official/
rsync -crv output/errata-corrected-r*rs*.pdf \
    alpha.servers.scheme.org:/production/standards/www/unofficial/
