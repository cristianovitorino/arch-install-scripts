#!/bin/bash

paru -S qgnomeplatform adwaita-qt breeze-snow-cursor-theme myxer nerd-fonts-bitstream-vera-mono nerd-fonts-dejavu-complete nerd-fonts-cascadia-code nerd-fonts-fira-code nerd-fonts-jetbrains-mono nerd-fonts-inter debtap

echo "export QT_QPA_PLATFORMTHEME='gnome'" >> ~/.bashrc

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text
