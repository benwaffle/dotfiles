#!/bin/bash

set -e

function die {
    echo $@
    exit
}

[[ $# -eq 1 ]] || die "usage: $0 <jnlp file>"

[[ -f $1 ]] || die "no such file \`$1'"

cp $1 /tmp
cd /tmp
firejail --seccomp --private=/tmp/home javaws /tmp/$(basename $1)
rm /tmp/$(basename $1)
