#!/usr/bin/env bash

set -euo pipefail

[[ $# == 4 ]] || (echo 'need args'; exit 1)

repo=$1
chart=$2
oldv=$3
newv=$4

tmp=$(mktemp -d)

pushd $tmp

helm2 fetch $repo/$chart --version $oldv
helm2 fetch $repo/$chart --version $newv

mkdir $chart-$oldv
pushd $chart-$oldv
tar xvzf ../$chart-$oldv.tgz
popd

mkdir $chart-$newv
pushd $chart-$newv
tar xvzf ../$chart-$newv.tgz
popd

git diff $chart-$oldv $chart-$newv

popd
