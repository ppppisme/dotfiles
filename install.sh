#!/usr/bin/sh

installer="sudo pikaur -S --needed --noconfirm"

prompt() {
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
}

install_zsh () {
  action 'install_package zsh' 'Install zsh'
  action 'stow vim -R' 'Deploy zsh config'
}

install_x () {
  action 'install_package xorg xorg-xinit' 'Install X11'
}

action 'install_package stow' 'Install stow'
install_neovim
install_x
install_awesomewm
install_qutebrowser
action 'install_package git' 'Install git'
install_zsh
action 'install_package xclip' 'Install xclip'

exit

prompt 'Install qutebrowser? [Y/n]' install_qutebrowser
echo
prompt 'Install awesomewm? [Y/n]' install_awesomewm
echo
prompt 'Install neovim? [Y/n]' install_neovim

# development
$installer ack ctags dbeaver zeal fd

# graphics
$installer sxiv
$installer maim
$installer gimp inkscape

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
$installer ungoogled-chromium firefox

# communication
$installer irssi perl-glib-object-introspection perl-html-parser
$installer telegram-desktop

# appearance
$installer compton lxappearance materia-gtk-theme

# alternative kernel
$installer linux-zen linux-zen-headers

# power management
$installer powertop tlp

# fonts
$installer terminus-font-otb

# misc
$installer acpi deluge sshfs htop physlock redshift unzip fff gbdfed bitwarden-bin rtv
