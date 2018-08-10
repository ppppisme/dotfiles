#!/bin/bash

# Applicable for arch linux only.

installer=trizen

$installer -S awesome
$installer -S neovim
$installer -S termite
$installer -S zsh

# Compton with kawase blur effect
# See https://github.com/tryone144/compton
# $installer -S compton-tryone-git


# vim
stow vim
mkdir ~/.vim/{backup,swap,undo}

# misc
$installer -S alsa-utils
$installer -S pavucontrol
$installer -S acpi
$installer -S xclip
$installer -S feh
