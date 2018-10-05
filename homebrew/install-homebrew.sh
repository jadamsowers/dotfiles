#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IFS=$'\r\n' GLOBIGNORE='*' command eval 'packages=($(cat $scriptdir/packages))'
IFS=$'\r\n' GLOBIGNORE='*' command eval 'casks=($(cat $scriptdir/casks))'

if [ -x "$(command -v brew)" ]
then
    echo "It seems homebrew is already installed. Skipping."
else
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating homebrew"
brew update

echo "Tapping homebrew cask"
brew tap caskroom/cask

echo "Tapping homebrew cask: fonts"
brew tap caskroom/cask-fonts

echo "Installing packages"
#printf -v packages "%s\n" "${PACKAGES[*]}"
for package in "${packages[@]}"
do
    brew install $package
done

echo "Installing casks"
for cask in "${casks[@]}"
do 
    brew cask install $cask
done

echo "Running cleanup tasks"
brew upgrade; brew prune; brew cleanup; brew doctor

echo "Done."