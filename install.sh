#!/bin/bash

installer="sudo pacman -S"

# base
$installer awesome neovim git stow zsh xclip xorg-xinit

# development
$installer ack ctags dbeaver zeal

# graphics
$installer feh gimp inkscape scrot

# gaming
$installer nvidia steam steam-native-runtime lutris

# sound
$installer alsa-utils pavucontrol pulseaudio-alsa

# video
$installer mpv youtube-dl
$installer kdenlive obs

# privacy
$installer tor

# music
$installer audacity helm lmms supercollider

# browsers
$installer qutebrowser chromium firefox

# communication
$installer weechat telegram-desktop

# appearance
$installer compton lxappearance materia-gtk-theme

# misc
$installer acpi deluge sshfs htop physlock redshift unzip ranger
