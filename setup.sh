#!/bin/sh
set -eux

brew update
brew upgrade

brew install --cask mos
brew install --cask maccy
brew install --cask app-cleaner
brew install --cask karabiner-elements 
brew install --cask monitorcontrol
brew install --cask rectangle


mkdir -p ~/Library/Application\ Support/Rectangle
mkdir -p ~/.config/karabiner
ln -sf $(pwd)/RectangleConfig.json ~/Library/Application\ Support/Rectangle/RectangleConfig.json
ln -sf $(pwd)/karabiner.json ~/.config/karabiner/karabiner.json
