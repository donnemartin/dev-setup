#!/usr/bin/env bash

echo "------------------------------"
echo "Setting up JavaScript web development environment."
echo "------------------------------"
echo ""

./.dev-setup/brew-bundle.sh install --file=.dev-setup/brewfiles/web

npm install -g coffee-script
npm install -g grunt-cli
npm install -g jshint
npm install -g less

#gem install jekyll
