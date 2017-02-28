#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

#Sync if possible
if [ -f .git ]
then
    git pull origin master;
else 
	echo "dev-setup was not cloned, unable to sync."
fi

