#!/bin/bash
set -euo pipefail

# Install zsh if not present
if ! command -v zsh &>/dev/null; then
  if command -v apt-get &>/dev/null; then
    sudo apt-get update -qq && sudo apt-get install -y --no-install-recommends zsh fzf
  elif command -v brew &>/dev/null; then
    brew install zsh fzf
  fi
fi

# Set zsh as default shell if not already
if [ "$(basename "$SHELL")" != "zsh" ] && command -v zsh &>/dev/null; then
  ZSH_PATH=$(command -v zsh)
  # Add to /etc/shells if missing
  grep -qxF "$ZSH_PATH" /etc/shells 2>/dev/null || echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
  sudo chsh -s "$ZSH_PATH" "$(whoami)" 2>/dev/null || true
fi

# Install chezmoi if not present
if ! command -v chezmoi &>/dev/null; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
fi

export PATH="$HOME/.local/bin:$PATH"

# Apply dotfiles
chezmoi init --apply tasandberg
