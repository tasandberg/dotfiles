#!/bin/bash
set -euo pipefail

# Install chezmoi and apply dotfiles
if ! command -v chezmoi &>/dev/null; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
fi

export PATH="$HOME/.local/bin:$PATH"

# Apply dotfiles (non-interactive, use defaults from .chezmoi.toml.tmpl)
chezmoi init --apply tasandberg
