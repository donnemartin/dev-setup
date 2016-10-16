#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

brew install node

# Remove outdated versions from the cellar.
brew cleanup

npm install -g coffee-script
npm install -g grunt-cli
npm install -g jshint
npm install -g less

#gem install jekyll
