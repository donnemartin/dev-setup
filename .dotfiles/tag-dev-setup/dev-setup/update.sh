#!/bin/bash

# Change this update file in your rcm tag directory to your needs
# You should consider adapting the username to point to your repo
readonly username="omares"
readonly version="master"

readonly download_uri="https://github.com/${username}/dev-setup/tarball/${version}"

echo "Update via tarball download and extraction"
provision_enabled && curl -#L ${download_uri} | tar -xv --strip-components 1 --exclude={README.md,LICENSE}


