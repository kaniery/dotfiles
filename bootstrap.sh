#!/bin/bash

if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
else
    SUDO=""
fi

echo "Installing Ansible..."

$SUDO pacman -Sy --noconfirm git ansible

hash -r

DEST="$HOME/dotfiles"
if [ ! -d "$DEST/.git" ]; then
    git clone https://github.com/kaniery/dotfiles.git "$DEST"
else
    cd "$DEST" && git pull
fi

cd "$DEST"
echo "Running Ansible Playbook..."
ansible-playbook local.yml
