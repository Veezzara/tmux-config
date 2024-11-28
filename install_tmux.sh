#!/bin/bash

# Configuration
REPO_URL="https://github.com/your-username/tmux-config.git"
TMUX_CONF_PATH="$HOME/.tmux.conf"
TMUX_DIR_PATH="$HOME/.config/tmux"
BACKUP_DIR="$HOME/tmux_backup"

# 1. Backup existing configuration
if [ -f "$TMUX_CONF_PATH" ] || [ -d "$TMUX_DIR_PATH" ]; then
    echo "Backing up existing tmux configuration to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    [ -f "$TMUX_CONF_PATH" ] && mv "$TMUX_CONF_PATH" "$BACKUP_DIR/"
    [ -d "$TMUX_DIR_PATH" ] && mv "$TMUX_DIR_PATH" "$BACKUP_DIR/"
fi

# 2. Clone the repository
echo "Cloning tmux configuration repository..."
git clone "$REPO_URL" "$HOME/tmux-config"

# 3. Deploy the configuration
if [ -f "$HOME/tmux-config/.tmux.conf" ]; then
    echo "Deploying .tmux.conf"
    ln -sf "$HOME/tmux-config/.tmux.conf" "$TMUX_CONF_PATH"
fi

if [ -d "$HOME/tmux-config/tmux" ]; then
    echo "Deploying tmux directory"
    ln -sf "$HOME/tmux-config/tmux" "$TMUX_DIR_PATH"
fi

echo "Tmux configuration installed successfully!"

