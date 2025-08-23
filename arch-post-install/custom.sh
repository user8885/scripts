#!/usr/bin/env bash

cd ~/Downloads/git
git clone https://github.com/user8885/dotfiles
cd dotfiles

mkdir ~/pre_custom

mv ~/.config ~/pre_custom/
mv .config ~/.config

mkdir ~/.local/bin
mv .local/bin/* ~/.local/bin/

mv scripts ~/

mv ~/.bashrc ~/pre_custom/
mv .bashrc ~/

mv ~/.profile ~/pre_custom/
mv .profile ~/

mv ~/.bash_profile ~/pre_custom
mv .bash_profile ~/

exit
