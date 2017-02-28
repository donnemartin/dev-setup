#!/usr/bin/env bash

function runDots() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ $ARG == "update" ] || [ $ARG == "all" ]; then
            echo ""
            echo "------------------------------"
            echo "Syncing dev-setup repo to your local working directory: $(pwd)"
            echo "------------------------------"
            echo ""
            ./update.sh
        fi
		if [ $ARG == "dots" ] || [ $ARG == "all" ]; then
            echo ""
            echo "------------------------------"
            echo "Syncing dev-setup dot files to your local home directory `~`"
            echo "------------------------------"
            echo ""
            ./dots.sh
        fi
        if [ $ARG == "osxprep" ] || [ $ARG == "all" ]; then
            # Run the osxprep.sh Script
            echo ""
            echo "------------------------------"
            echo "Updating OSX and installing Xcode command line tools."
            echo "------------------------------"
            echo ""
            ./osxprep.sh
        fi
        if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
            # Run the brew.sh Script
            # For a full listing of installed formulae and apps, refer to
            # the commented brew.sh source file directly and tweak it to
            # suit your needs.
            echo ""
            echo "------------------------------"
            echo "Installing Homebrew along with some common formulae and apps."
            echo "This might awhile to complete, as some formulae need to be installed from source."
            echo "------------------------------"
            echo ""
            ./brew.sh
        fi
        if [ $ARG == "osx" ] || [ $ARG == "all" ]; then
            # Run the osx.sh Script
            # I strongly suggest you read through the commented osx.sh
            # source file and tweak any settings based on your personal
            # preferences. The script defaults are intended for you to
            # customize. For example, if you are not running an SSD you
            # might want to change some of the settings listed in the
            # SSD section.
            echo ""
            echo "------------------------------"
            echo "Setting sensible OSX defaults."
            echo "------------------------------"
            echo ""
            ./osx.sh
        fi
        if [ $ARG == "pydata" ] || [ $ARG == "all" ]; then
            # Run the pydata.sh Script
            echo "------------------------------"
            echo "Setting up Python data development environment."
            echo "------------------------------"
            echo ""
            ./pydata.sh
        fi
        if [ $ARG == "aws" ] || [ $ARG == "all" ]; then
            # Run the aws.sh Script
            echo "------------------------------"
            echo "Setting up AWS development environment."
            echo "------------------------------"
            echo ""
            ./aws.sh
        fi
        if [ $ARG == "datastores" ] || [ $ARG == "all" ]; then
            # Run the datastores.sh Script
            echo "------------------------------"
            echo "Setting up data stores."
            echo "------------------------------"
            echo ""
            ./datastores.sh
        fi
        if [ $ARG == "web" ] || [ $ARG == "all" ]; then
            # Run the web.sh Script
            echo "------------------------------"
            echo "Setting up JavaScript web development environment."
            echo "------------------------------"
            echo ""
            ./web.sh
        fi
        if [ $ARG == "android" ] || [ $ARG == "all" ]; then
            # Run the android.sh Script
            echo "------------------------------"
            echo "Setting up Android development environment."
            echo "------------------------------"
            echo ""
            ./android.sh
        fi
    done

    echo "------------------------------"
    echo "Completed running setup, restart your computer to ensure all updates take effect"
    echo "------------------------------"
}

runDots $@

unset runDots;
