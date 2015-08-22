#!/usr/bin/env bash

# ~/aws.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "------------------------------"
echo "Setting up AWS."
echo "This script requires pip and virtualenvwrapper to be installed."
echo "See the pydata.sh script."

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
mkvirtualenv py2-data
workon py2-data

pip install boto
pip install awscli
pip install mrjob
pip install s3cmd

EXTRA_PATH=~/.extra
echo $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "# Configure aws cli autocomplete, added by aws.sh" >> $EXTRA_PATH
echo "complete -C '~/.virtualenvs/py2-data/bin/aws_completer' aws" >> $EXTRA_PATH
source $EXTRA_PATH

###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Updating py3-data virtual environment with AWS modules."

# Create a Python3 data environment
# If this environment already exists from running pydata.sh,
# it will not be overwritten
mkvirtualenv --python=/usr/local/bin/python3 py3-data
workon py3-data

pip install boto
pip install awscli
#pip install mrjob  # Python 2 only
#pip install s3cmd  # Python 2 only

# Uncomment if you want to hook up the aws cli autocomplete for Python 3
#EXTRA_PATH=~/.extra
#echo $EXTRA_PATH
#echo "" >> $EXTRA_PATH
#echo "" >> $EXTRA_PATH
#echo "# Configure aws cli autocomplete, added by aws.sh" >> $EXTRA_PATH
#echo "complete -C '~/.virtualenvs/py3-data/bin/aws_completer' aws" >> $EXTRA_PATH
#source $EXTRA_PATH

###############################################################################
# System-Wide Packages                                                        #
###############################################################################

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

brew install apache-spark

###############################################################################
# Install IPython Notebook Spark Integration
###############################################################################

echo "------------------------------"
echo "Installing IPython Notebook Spark integration"

# Add the pyspark IPython profile
cp -r init/profile_pyspark/ ~/.ipython/profile_pyspark

BASH_PROFILE_PATH=~/.bash_profile
echo $BASH_PROFILE_PATH
echo "" >> $BASH_PROFILE_PATH
echo "" >> $BASH_PROFILE_PATH
echo "# IPython Notebook Spark integration, added by aws.sh" >> $BASH_PROFILE_PATH
# Run $ brew info apache-spark to determine the Spark install location
echo "export SPARK_HOME='/usr/local/Cellar/apache-spark/1.4.1'" >> $BASH_PROFILE_PATH
echo "# Appending pyspark-shell is needed for Spark 1.4+" >> $BASH_PROFILE_PATH
echo "export PYSPARK_SUBMIT_ARGS='--master local[2] pyspark-shell'" >> $BASH_PROFILE_PATH
echo "" >> $BASH_PROFILE_PATH
source $BASH_PROFILE_PATH

echo "------------------------------"
echo "TODO: Update .aws/ with your AWS credentials and region, or run aws --configure."
echo "TODO: Update .mrjob.conf with your credentials, keypair, keypair location, region, and bucket info."
echo "TODO: Update .s3cfg with your credentials, location, and passphrase or run s3cmd --configure."
echo "Script completed."