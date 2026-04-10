#!/bin/bash
sudo pacman -S --noconfirm git ansible

if [ ! -d "~/mysetup" ]; then
    git clone https://github.com/kaniery/dotfiles.git ~/mysetup
fi

cd ~/mysetup
ansible-playbook local.yml