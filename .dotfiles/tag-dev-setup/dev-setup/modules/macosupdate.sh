#!/bin/bash

if [[ "${EUID}" -ne 0 ]]; then
  echo "This module requires sudo rights."
  echo "You should run this module using the dev-setup script in your home directory."
  exit 1
fi

echo "------------------------------"
echo "Updating macOS. If this requires a restart, run the script again."
echo "------------------------------"
echo ""

# Install all available updates
sudo softwareupdate -i -a

# homebrew is installing xcode there this step is not needed
# for convenience i am leaving this here
#if [[ -z $(xcode-select -p) ]]; then
#    echo "------------------------------"
#    echo "Installing Xcode Command Line Tools."
#
#    xcode-select --install
#fi
