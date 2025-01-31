#!/bin/bash

# Exit on any error
set -e

echo "Installing TPM (Tmux Plugin Manager)..."

# Check if TPM directory already exists
if [ -d "${HOME}/.tmux/plugins/tpm" ]; then
    echo "TPM directory already exists. Removing..."
    rm -rf "${HOME}/.tmux/plugins/tpm"
fi

# Clone TPM
git clone git@github.com:demiurge94/tpm-demi.git ~/.tmux/plugins/tpm

# Check if .tmux.conf already exists in home directory
if [ -f "${HOME}/.tmux.conf" ]; then
    echo "Existing .tmux.conf found. Creating backup..."
    mv "${HOME}/.tmux.conf" "${HOME}/.tmux.conf.backup"
fi

# Copy .tmux.conf to home directory
echo "Installing .tmux.conf..."
cp .tmux.conf "${HOME}/.tmux.conf"

echo "Installation complete!"
echo "Please restart tmux or source your configuration with 'tmux source ~/.tmux.conf'"
