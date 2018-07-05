#!/bin/bash

# Applicable for arch linux only.

installer=trizen

$installer -S awesome
$installer -S nvim
$installer -S termite
$installer -S zsh

# Compton with kawase blur effect
# See https://github.com/tryone144/compton
$installer -S compton-tryone-git

