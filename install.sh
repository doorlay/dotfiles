#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR"

log() {
    printf "[dotfiles] %s\n" "$1"
}

have() {
    command -v "$1" >/dev/null 2>&1
}

install_pkg() {
    if have apt-get; then
        sudo apt-get update -y
        sudo apt-get install -y "$@"
    elif have brew; then
        brew install "$@"
    else
        log "No supported package manager found. Install $* manually."
        return 1
    fi
}

# ---------------------------
# Install prerequisites
# ---------------------------

MISSING=()

have git || MISSING+=(git)
have vim || MISSING+=(vim)

if (( ${#MISSING[@]} > 0 )); then
    log "Missing packages: ${MISSING[*]}"
    install_pkg "${MISSING[@]}"
else
    log "git and vim already installed"
fi

# Set default shell to bash
if [[ "$SHELL" != "$(command -v bash)" ]]; then
    log "Setting default shell to bash"
    chsh -s "$(command -v bash)"
else
    log "Default shell already bash"
fi

# ---------------------------
# Dotfile symlink logic
# ---------------------------

link_file() {
    local name="$1"
    local src="$DOTFILES_DIR/$name"
    local dst="$HOME/.$name"

    if [[ ! -e "$src" ]]; then
        log "Skipping $name (not found in repo)"
        return
    fi

    if [[ -e "$dst" && ! -L "$dst" ]]; then
        log "Backing up .$name"
        mv "$dst" "$BACKUP_DIR/"
    fi

    [[ -L "$dst" ]] && rm "$dst"

    ln -s "$src" "$dst"
    log "Linked .$name"
}

link_file bashrc
link_file bash_profile
link_file vimrc
link_file inputrc
link_file gitconfig

log "Dotfiles installation complete"
