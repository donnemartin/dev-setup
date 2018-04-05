#!/bin/bash

readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "------------------------------"
echo "Setting up data stores."
echo "------------------------------"
echo ""

brew bundle install --file="${SCRIPT_DIR}/../brewfiles/datastores"
