#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IFS=$'\r\n' GLOBIGNORE='*' command eval 'extensions=($(cat $scriptdir/extensions))'
for extension in "${extensions[@]}"
do
    code --install-extension $extension
done