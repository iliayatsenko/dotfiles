#!/bin/sh
set -eux

# Install util apps
brew install --cask mos
brew install --cask maccy
brew install --cask app-cleaner
brew install --cask karabiner-elements 
brew install --cask monitorcontrol
brew install --cask rectangle


# Link config files
mkdir -p ~/Library/Application\ Support/Rectangle
mkdir -p ~/.config/karabiner
ln -sf $(pwd)/RectangleConfig.json ~/Library/Application\ Support/Rectangle/RectangleConfig.json
ln -sf $(pwd)/karabiner.json ~/.config/karabiner/karabiner.json


# Git aliases
git config --global alias.cb "rev-parse --abbrev-ref HEAD"
git config --global alias.st "status"
git config --global alias.nb "checkout -b"
git config --global alias.back "checkout -"
git config --global alias.ch "checkout"
