#!/bin/bash

package=$1
version=$2
if [ "$#" -eq 2 ]; then
    pip install --user "$package==$version"
else
    pip install --user --upgrade "$package"
fi
