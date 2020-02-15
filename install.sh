#!/usr/bin/sh

installer='sudo pikaur -S --needed --noconfirm'

prompt () {
  printf '%s ' "$1"
  read -r yn

  case $yn in
    [Yy]|"" ) eval "$2"; return;;
    [Nn]* ) return;;
  esac
}

action () {
  printf ':: %s' "$2"
  eval "$1" 1> /dev/null
  echo '... Done.'
}

install_package () {
  $installer "$@" 2> /dev/null
}

install_qutebrowser () {
  action 'install_package qutebrowser' 'Install qutebrowser'

  action 'stow qutebrowser -R' 'Deploy qutebrowser config'
  action \
    'sudo xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop' \
    'Set qutebrowser as default browser'
}

install_awesomewm () {
  action 'install_package awesome' 'Install awesomewm'
  action 'stow awesome -R' 'Deploy awesomewm config'
}

install_neovim () {
  action 'install_package neovim' 'Install neovim'
  action 'stow vim -R' 'Deploy neovim config'
  action 'install_package ack ctags' 'Install neovim dependencies'
  action "mkdir $HOME/.vim/{backup,swap,undo} -p" 'Create temporary directories'
}

install_zsh () {
  action 'install_package zsh' 'Install zsh'
  action 'stow vim -R' 'Deploy zsh config'
}

install_x () {
  action 'install_package xorg xorg-xinit' 'Install X11'
  action 'stow xinit -R' 'Deploy xinitrc config'
}

install_tor () {
  action 'install_package tor torsocks' 'Install tor'
  action 'sudo systemctl enable --now tor.service' 'Start tor now and on every system boot'
}

install_pikaur () {
  # we do not have our custom installer yet, so use pacman
  action 'sudo pacman -S wget' 'Install wget'
  pwd=$PWD
  cd /tmp || exit
  action 'wget https://aur.archlinux.org/cgit/aur.git/snapshot/pikaur.tar.gz' 'Download pikaur package'
  action 'tar xvf pikaur.tar.gz' 'Unpack pikaur'
  cd pikaur || exit
  action 'makepkg -sri' 'Build pikaur'
  cd "$pwd" || exit
}

install_steam () {
  echo ':: Enable multilib repository'
  start=$(awk '/\[multilib\]/{ print NR; exit }' /etc/pacman.conf)
  sudo sed -i "$start,$((start + 1))s/^#//" /etc/pacman.conf

  action 'sudo pacman -Syy' 'Update packages database since we added multilib repository'
  action \
    'install_package steam steam-native-runtime lib32-virtualgl lib32-nvidia-utils lib32-mesa-libgl' \
    'Install steam packages'
}

install_irssi () {
  action 'install_package irssi perl-glib-object-introspection perl-html-parser' 'Install irssi'
  action 'stow irssi -R' 'Deploy irssi config'
}

install_notebook_stuff () {
  action 'install_package acpi powertop tlp' 'Install acpi, powertop, tlp'
  action 'sudo systemctl enable --now tlp.service' 'Start tlp now and on every system boot'
}

install_picom () {
  action 'install_package picom' 'Install picom'
  action 'stow picom -R' 'Deploy picom config'
}

# enter sudo-mode before doing anything
sudo echo ':: Start installation script'

action 'sudo pacman -Syyu' 'Update packages database and packages themself'
install_pikaur
action 'install_package stow' 'Install stow'
install_neovim
install_x
install_awesomewm
action 'install_package alsa-utils pavucontrol pulseaudio-alsa' 'Install audio-related stuff'
install_qutebrowser
action 'install_package git' 'Install git'
install_zsh
action 'install_package xclip' 'Install xclip'
action 'install_package sxiv' 'Install sxiv'
action 'install_package maim' 'Install maim'
action 'install_package mpv' 'Install mpv'
action 'install_package youtube-dl' 'Install youtube-dl'
action 'install_package zathura zathura-pdf-poppler' 'Install zathura'
action 'install_package fff' 'Install fff'
action 'stow fonts -R' 'Install fonts'
action 'stow bin -R' 'Install custom bin/ apps'
# TODO: move to fonts directory
action 'install_package terminus-font-otb' 'Install terminus-font-otb'
install_tor
install_irssi
action 'install_package telegram-desktop' 'Install telegram-desktop'
action 'install_package lxappearance' 'Install lxapperance'
action 'install_compton' 'Install compton'
action 'install_package htop' 'Install htop'
action 'install_package physlock' 'Install physlock'
action 'install_package redshift' 'Install redshift'
action 'install_package sshfs' 'Install sshfs'
action 'install_package unzip' 'Install unzip'
action 'install_package bitwarden-bin' 'Install bitwarden'

prompt 'Install notebook-related stuff? [Y/n]' 'install_notebook_stuff'
prompt 'Install dbeaver? [Y/n]' 'install_package dbeaver'
prompt 'Install firefox and brave? [Y/n]' 'install_package firefox brave-bin'
prompt 'Install gimp? [Y/n]' 'install_package gimp'
prompt 'Install inkscape? [Y/n]' 'install_package inkscape'
prompt 'Install NVIDIA drivers? [Y/n]' 'install_package nvidia-dkms'
prompt 'Install lutris? [Y/n]' 'install_package lutris'
prompt 'Install steam? [Y/n]' 'install_steam'
prompt 'Install libreoffice? [Y/n]' 'install_package libreoffice'
prompt 'Install mps-youtube? [Y/n]' 'install_package mps-youtube'
prompt 'Install obs? [Y/n]' 'install_package obs'
prompt 'Install olivia? [Y/n]' 'install_package olivia'
prompt 'Install ardour? [Y/n]' 'install_package ardour'
prompt 'Install audacity? [Y/n]' 'install_package audacity'
prompt 'Install lmms? [Y/n]' 'install_package lmms'
prompt 'Install jack2? [Y/n]' 'install_package jack2 cadence a2jmidid pulseaudio-jack'
prompt 'Install helm, dexed, fabla? [Y/n]' 'install_package helm dexed fabla'
prompt 'Install deluge? [Y/n]' 'install_package deluge'

echo ':: Done!'

# supercollider linux-zen linux-zen-headers materia-gtk-theme gbdfed  rtv
