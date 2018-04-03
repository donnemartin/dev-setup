#!/usr/bin/env bash

echo "------------------------------"
echo "Setting up data stores."
echo "------------------------------"
echo ""

./.dev-setup/brew-bundle.sh install --file=.dev-setup/brewfiles/datastores
