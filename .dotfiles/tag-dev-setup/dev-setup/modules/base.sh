#!/bin/bash

if [[ $(command -v brew) == "" ]]; then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating homebrew..."
    brew update
fi


if [[ $(command -v rcup) == "" ]]; then

    echo "------------------------------"
    echo "Installing rcm suite"

    brew bundle install --file=../brewfiles/essentials
fi

echo "------------------------------"
echo "Updating and/or installing dotfiles"
echo "------------------------------"

# Update and/or install dotfiles. These dotfiles are stored in the .dotfiles directory.
# rcup is used to install files from the tag-specific dotfiles directory.
# rcup is part of rcm, a management suite for dotfiles
# Check https://github.com/thoughtbot/rcm for more info
env RCRC=".rcrc" rcup
