#!/usr/bin/env bash


# This script might be run with .dots, which uses elevated privileges
sudo -K

# Make sure we’re using the latest Homebrew.
brew update

echo "------------------------------"
echo "Getting GCP SDK."
echo "------------------------------"

# https://github.com/Homebrew/homebrew-core/issues/583
brew tap caskroom/cask
brew cask install google-cloud-sdk

echo "------------------------------"
echo "Setting up GCP SDK."
echo "------------------------------"

# this will disable usage-reporting, will update PATH for SDK, enable command-completion for SDK
# --quiet will disable questions about PATH, command-completition and usage-reporting
/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/install.sh --usage-reporting=false --quiet

# Remove outdated versions from the cellar.
brew cleanup
