#!/usr/bin/env bash

# Change this update file in your rc tag directory to your needs
# You should consider adapting the _DOWNLOAD_URI path to your repo
readonly _DOWNLOAD_URI="https://github.com/omares/dev-setup/tarball/master"

echo "Update via tarball download and extraction"
provision_enabled && curl -#L ${_DOWNLOAD_URI} | tar -xv --strip-components 1 --exclude={README.md,LICENSE}
