#!/usr/bin/env bash

./.dev-setup/brew-bundle.sh install --file=.dev-setup/brewfiles/web

npm install -g coffee-script
npm install -g grunt-cli
npm install -g jshint
npm install -g less

#gem install jekyll
