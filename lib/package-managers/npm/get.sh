#!/bin/sh

dir=$(npm root -g 2> /dev/null)
packages="$(ls $dir)"

IFS=$'\n'
for package in $packages; do
    pacdir="$dir/$package"
    version="$(jq -r '.version' $pacdir/package.json)"
    echo "$package $version"
done
