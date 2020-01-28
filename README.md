# dotfiles

The dotfiles that I like to be common across my setups.
Nothing special or out of the ordinary.

## Initialization

Run `make init` to pull dependencies.

## Installing

I don't use anything to manage my dotfiles. I'm simple and uncultured. I use a
Makefile to install them. You can too with `make install`.

## scripts

I've also included some scripts that I use for setting up systems and keeping
them up-to-date for my development purposes.

## dependencies

### neovim/vim

Run the `install-coc-extensions` script. (Note: This will take a while to run.
During running, the screen will appear blank.)

Install your distributions packages for:

* node.js
* npm
* shellcheck

Install your distributions packages or use node/npm to install:

* bash-language-server
* markdownlint
* write-good

### golang

Run the `install-go-tools` script.

### python

You'll need to install your distributions packages for:

* python-black
* flake8
* pylint
