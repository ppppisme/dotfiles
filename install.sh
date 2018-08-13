#!/bin/bash

# Applicable for arch linux only.

installer="sudo pacman"

$installer -S awesome
$installer -S neovim
$installer -S termite
$installer -S zsh

# vim
stow vim
mkdir ~/.vim/{backup,swap,undo}

# misc
$installer -S alsa-utils
$installer -S pavucontrol
$installer -S acpi
$installer -S xclip
$installer -S feh

$installer -S materia-gtk-theme
