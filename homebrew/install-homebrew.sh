#!/bin/bash
PACKAGES=(
    "bash-completion"
    "colordiff"
    "cowsay"
    "dos2unix"
    "fortune"
    "git-flow"
    "htop"
    "lolcat"
    "lynx"
    "ncdu"
    "nmap"
    "tig"
    "tmux"
    "tree"
    "vimpager"
    "wget"
)

CASKS=(
    "dropbox"
    "google-chrome"
    "iterm2"
    "skype"
    "slack"
    "the-unarchiver"
    "virtualbox"
    "visual-studio-code"
)

echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Updating homebrew"
brew update

echo "Installing homebrew cask"
brew tap caskroom/cask

echo "Installing packages"
#printf -v packages "%s\n" "${PACKAGES[*]}"
for package in "${PACKAGES[@]}"
do
    brew install $package
done

echo "Installing casks"
for cask in "${CASKS[@]}"
do 
    brew cask install $cask
done

echo "Running cleanup tasks"
brew upgrade; brew prune; brew cleanup; brew doctor

echo "Done."