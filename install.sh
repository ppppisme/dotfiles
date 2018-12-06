#!/bin/bash

installer="sudo pacman -S"

# base
$installer awesome neovim git stow zsh xclip xorg-xinit

# development
$installer ack ctags dbeaver zeal

# graphics
$installer feh
$installer sxiv
$installer gimp inkscape scrot

# gaming
$installer nvidia steam steam-native-runtime lutris

# sound
$installer alsa-utils pavucontrol pulseaudio-alsa

# video
$installer mpv youtube-dl
$installer mps-youtube
$installer kdenlive obs

# privacy
$installer tor

# documents
$installer zathura zathura-pdf-poppler
$installer libreoffice

# music
$installer lmms
$installer helm
$installer supercollider
$installer audacity

# browsers
$installer qutebrowser
$installer chromium firefox

# communication
$installer weechat telegram-desktop

# appearance
$installer compton lxappearance materia-gtk-theme

# misc
$installer acpi deluge sshfs htop physlock redshift unzip ranger
