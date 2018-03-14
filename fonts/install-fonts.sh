#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Cloning Powerline fonts git repository"
git clone https://github.com/powerline/fonts/ ~/fonts

# load contents of fontlist into array
IFS=$'\r\n' GLOBIGNORE='*' command eval  'fonts=($(cat $scriptdir/fontlist))'
                
for font in "${fonts[@]}"
do
    echo "Installing $font"
    cp -R ~/fonts/$font/*.*tf ~/Library/Fonts
done

