#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install data stores
brew install mysql
brew install postgresql
brew install mongo
brew install redis
brew install elasticsearch

# Install mysql workbench
# Install Cask
brew install caskroom/cask/brew-cask
brew cask install --appdir="/Applications" mysqlworkbench

# Remove outdated versions from the cellar.
brew cleanup
