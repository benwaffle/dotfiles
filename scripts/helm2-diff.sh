#!/usr/bin/env bash

set -euo pipefail

[[ $# == 4 ]] || (echo 'need args'; exit 1)

repo=$1
chart=$2
oldv=$3
newv=$4

tmp=$(mktemp -d)

pushd $tmp

mkdir $chart-$oldv
mkdir $chart-$newv

helm2 fetch $repo/$chart --version $oldv --untar --untardir $chart-$oldv
helm2 fetch $repo/$chart --version $newv --untar --untardir $chart-$newv

git diff $chart-$oldv $chart-$newv

popd
