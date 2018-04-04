#!/bin/bash

if [[ $(command -v brew) == "" ]]; then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating homebrew..."
    brew update
fi

brew bundle "$@"

# Remove outdated versions from the cellar.
brew cleanup
