#!/usr/bin/env bash

if [[ "${EUID}" -ne 0 ]]; then
  echo "This module requires sudo rights."
  echo "You should run this module using the dev-setup script in your home directory."
  exit 1
fi

echo ""
echo "------------------------------"
echo "Updating OSX and installing Xcode command line tools"
echo "------------------------------"
echo ""

# Step 1: Update the OS and Install Xcode Tools
echo "------------------------------"
echo "Updating OSX.  If this requires a restart, run the script again."

# Install all available updates
sudo softwareupdate -i -a

echo "------------------------------"
echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
xcode-select --install
