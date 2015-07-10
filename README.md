<p align="center">
  <img src="http://i.imgur.com/GMnses0.png">
</p>

data-dev-setup
============

Data developer setup, scripts, and tools.  Hacker defaults for OSX.

* [Using Git and the Bootstrap Script](#using-git-and-the-bootstrap-script)
* [Git-Free Install](#git-free-install)
* [Specify PATH](#specify-path)
* [Add Custom Commands](#add-custom-commands)
* [Sensible OSX Defaults](#sensible-osx-defaults)
* [Install Homebrew Formulae with Python2 and Python3](#install-homebrew-formulae-with-python2-and-python3)
* [Contributions](#contributions)
* [Credits](#credits)

## Using Git and the Bootstrap Script

You can clone the repository wherever you want. (I like to keep it in `~/dev/data-dev-setup`, with `~/data-dev-setup` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/donnemartin/data-dev-setup.git && cd data-dev-setup && source bootstrap.sh
```

To update, `cd` into your local `data-dev-setup` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

## Git-Free Install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/donnemartin/data-dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt}
```

To update later on, just run that command again.

## Specify PATH

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/donnemartin/data-dev-setup/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

## Add Custom Commands

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Donne Martin"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="donne.martin@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/donnemartin/data-dev-setup/fork) instead, though.

## Sensible OSX Defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

## Install Homebrew Formulae Including Python2 and Python3

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

## Contributions

Bug reports and suggestions are [welcome](https://github.com/donnemartin/data-dev-setup/issues)!

## Credits

This repo builds on the awesome work from the following repos:

* [dotfiles](https://github.com/mathiasbynens/dotfiles) by Mathias Bynens
* [mac-dev-setup](https://github.com/nicolashery/mac-dev-setup) by Nicolas Hery