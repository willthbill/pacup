#!/bin/bash

packages=( $(comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)) )
for package in ${packages[@]}; do
	s=$(apt-cache show $package | grep "Version" | head -n 1)
	regex="Version: (.*)"
	[[ $s =~  $regex ]]
	version=${BASH_REMATCH[1]}
	echo "$package@$version"
done
