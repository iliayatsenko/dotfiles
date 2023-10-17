#!/bin/bash
# output all the commands running
set -eux

# Install util apps
# makes non-apple mouses to work more smooth
if ! brew list mos &> /dev/null; then
  brew install --cask mos
fi

# clipboard buffer
if ! brew list maccy &> /dev/null; then
  brew install --cask maccy
fi

# cleaner way to delete apps
if ! brew list app-cleaner &> /dev/null; then
  brew install --cask app-cleaner
fi

# keyboard remapper
if ! brew list karabiner-elements &> /dev/null; then
  brew install --cask karabiner-elements
fi

# adjust external monitor brightness from keyboard
if ! brew list monitorcontrol &> /dev/null; then
  brew install --cask monitorcontrol
fi

# window manager
if ! brew list rectangle &> /dev/null; then
  brew install --cask rectangle
fi


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


# Cache git credentials in Keychain app
git config --global credential.helper osxkeychain
