#!/usr/bin/env bash

./.dotfiles/tag-dev-setup/brew-bundle.sh install --file=.dotfiles/tag-dev-setup/ds-brewfiles/web

npm install -g coffee-script
npm install -g grunt-cli
npm install -g jshint
npm install -g less

#gem install jekyll
