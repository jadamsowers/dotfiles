#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! [ "$1" != "" ]
then
    echo "Usage: $0 [Apple ID]"
    echo "Use 'mas list > apps' to capture list of currently installed apps."
    exit 1
else
    if ! [ -x "$(command -v mas)" ]
    then
        echo "The 'mas' program is required, but not installed. Try 'brew install mas'."
    else
        mas signin $1
        mas install 
        IFS=$'\r\n' GLOBIGNORE='*' command eval 'apps=($(cat $scriptdir/apps))'
        for app in "${apps[@]}"
        do
            appId=`echo $app | awk '{print $1}'`
            mas install $appId
        done
    fi
fi