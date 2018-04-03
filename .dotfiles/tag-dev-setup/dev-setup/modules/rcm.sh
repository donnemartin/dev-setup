#!/usr/bin/env bash

echo "------------------------------"
echo "Installing rcm via homebrew to setup all dotfiles."
echo "------------------------------"
echo ""

./.dev-setup/brew-bundle.sh install --file=.dev-setup/brewfiles/rcm

# setup dotfiles
env RCRC=".rcrc" rcup
