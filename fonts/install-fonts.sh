#!/bin/bash

echo "Cloning Powerline fonts git repository"
git clone https://github.com/powerline/fonts/ ~/fonts

declare -a fonts=(
                  "Hack"
                  "SourceCodePro"
                  "UbuntuMono"
                 )
                
for font in "${fonts[@]}"
do
    echo "Installing $font"
    cp -R ~/fonts/$font/*.*tf ~/Library/Fonts
done