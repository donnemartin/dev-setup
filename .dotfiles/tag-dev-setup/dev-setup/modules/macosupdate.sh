#!/bin/bash

if [[ "${EUID}" -ne 0 ]]; then
  echo "This module requires sudo rights."
  echo "You should run this module using the dev-setup script in your home directory."
  exit 1
fi

echo ""
echo "------------------------------"
echo "Updating macOS and the Xcode command line tools if not present"
echo "------------------------------"
echo ""

# Step 1: Update the OS and Install Xcode Tools
echo "------------------------------"
echo "Updating macOS. If this requires a restart, run the script again."

# Install all available updates
sudo softwareupdate -i -a

# normally homebrew installs xcode for us
if [[ -z $(xcode-select -p) ]]; then
    echo "------------------------------"
    echo "Installing Xcode Command Line Tools."

    xcode-select --install
fi
