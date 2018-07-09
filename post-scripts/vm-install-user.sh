#!/bin/bash

echo "Getting Dotfiles"
git clone https://github.com/tprasadtp/dotfiles
chmod +x ./dotfiles/cp2stow
echo "Copying Dotfiles"
(
cd ./dotfiles
./cp2stow -c
)
echo "Symlinking Dotfiles"
(
rm -f ~/.bashrc
cd ~/Dotfiles
./stow-dotfiles -s
)
echo "Setting up GPG Public keys"
curl -s https://prasadt.com/gpg/prasadt-current-gpg-key.asc | gpg --import
