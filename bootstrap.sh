#!/bin/bash

# 1. 権限確認
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo"
fi

echo "Installing Ansible..."
sudo pacman -Sy --noconfirm git ansible

hash -r

REPO_URL="https://github.com/kaniery/dotfiles.git"
DEST="$HOME/mysetup"

if [ ! -d "$DEST" ]; then
    git clone "$REPO_URL" "$DEST"
else
    cd "$DEST" && git pull
fi

cd "$DEST"
echo "Running Ansible Playbook..."
ansible-playbook local.yml
