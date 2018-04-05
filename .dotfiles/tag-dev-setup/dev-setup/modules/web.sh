#!/bin/bash

readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "------------------------------"
echo "Setting up JavaScript web development environment."
echo "------------------------------"
echo ""

brew bundle install --file="${SCRIPT_DIR}/../brewfiles/web"

npm install -g coffee-script
npm install -g grunt-cli
npm install -g jshint
npm install -g less

#gem install jekyll
