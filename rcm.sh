#!/usr/bin/env bash

./.dev-setup/brew-bundle.sh install --file=.dev-setup/brewfiles/rcm

# setup dotfiles
env RCRC=".rcrc" rcup
