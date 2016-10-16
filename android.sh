#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" Caskroom/versions/intellij-idea-ce
brew cask install --appdir="~/Applications" android-studio

brew install android-sdk

# Remove outdated versions from the cellar.
brew cleanup
