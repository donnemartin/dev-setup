#!/usr/bin/env bash

# ~/.pydata

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.pydata` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Setting up AWS."

echo "------------------------------"
echo "Source virtualenvwrapper from ~/.extra"
source ~/.extra

###############################################################################
# Python 2 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Updating py2-data virtual environment with AWS modules."

# Create a Python2 data environment
# If this environment already exists from running pydata.sh,
# it will not be overwritten
mkvirtualenv py2-data2
workon py2-data2

pip install boto
pip install awscli
pip install mrjob
pip install s3cmd

###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Updating py3-data virtual environment with AWS modules."

# Create a Python3 data environment
# If this environment already exists from running pydata.sh,
# it will not be overwritten
mkvirtualenv --python=/usr/local/bin/python3 py3-data2
workon py3-data2

pip install boto
pip install awscli
#pip install mrjob # Python 2 only
#pip install s3cmd # Python 2 only

echo "Script completed."