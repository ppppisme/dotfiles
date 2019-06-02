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
$installer nvidia-dkms steam steam-native-runtime lutris lib32-virtualgl lib32-nvidia-utils lib32-mesa-libgl

# sound
$installer alsa-utils pavucontrol pulseaudio-alsa
$installer jack2 cadence a2jmidid pulseaudio-jack

# video
$installer mpv youtube-dl
$installer mps-youtube
$installer olivia obs breeze-icons

# privacy
$installer tor torsocks

# documents
$installer zathura zathura-pdf-poppler
$installer libreoffice

# music
$installer lmms ardour
$installer helm dexed fabla
$installer supercollider
$installer audacity

# browsers
$installer qutebrowser
$installer ungoogled-chromium firefox

# communication
$installer irssi telegram-desktop

# appearance
$installer compton lxappearance materia-gtk-theme

# alternative kernel
$installer linux-zen linux-zen-headers

# misc
$installer acpi deluge sshfs htop physlock redshift unzip fff gbdfed bitwarden-bin rtv
