#!/usr/bin/env bash

function setup_dots() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.sh" \
        --exclude "*.md" --exclude "LICENSE" -avh --no-perms . ~;
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setup_dots;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup_dots;
    fi;
fi;
unset setup_dots;
