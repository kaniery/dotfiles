#!/bin/bash
set -e

if command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
else
    SUDO=""
fi

echo "--- 1. Installing dependencies ---"

$SUDO pacman -Sy --noconfirm git ansible

hash -r

echo "--- ２. Running Ansible Playbook ---"

ansible-playbook local.yml
