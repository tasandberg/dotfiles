# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## New machine setup

```bash
# 1. Bootstrap (installs chezmoi + zsh if needed, then applies)
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
~/.local/bin/chezmoi init --apply tasandberg

# 2. Store Bitwarden Secrets Manager access token in Keychain
security add-generic-password -a "$USER" -s "bws-access-token" -w "<token>"

# 3. Sync secrets
dotfiles secrets sync

# 4. Create machine-specific config
touch ~/.zshrc.local
```

The `run_once_before` script automatically installs all dependencies on first run. It's idempotent and works on both macOS (Homebrew) and Linux (apt + git clone):

- Homebrew (macOS only)
- neovim, tmux, jq, direnv, fzf
- rbenv + ruby-build, pnpm, goenv
- oh-my-zsh, [pure prompt](https://github.com/sindresorhus/pure)
- vim-plug (for neovim)
- bws (Bitwarden Secrets CLI)

## Shell load order

```
~/.zshrc
  -> ~/.config/shell/prompt.zsh      # pure prompt
  -> ~/.config/shell/variables.zsh   # env vars, PATH, tool inits
  -> oh-my-zsh (git plugin)
  -> ~/.config/shell/aliases.zsh     # tracked aliases
  -> ~/.fzf.zsh
  -> ~/.zshrc.local                  # machine-specific (not tracked)
```

Secrets from `~/.config/secrets/env` are sourced via `.zshrc.local`.

## `dotfiles` CLI

A custom command at `~/.local/bin/dotfiles` for day-to-day management:

| Command | Description |
|---|---|
| `dotfiles edit aliases\|variables\|prompt\|local\|zshrc` | Edit a config file, then apply |
| `dotfiles apply` | Apply chezmoi changes |
| `dotfiles push [message]` | Commit and push |
| `dotfiles status` | Show pending diff |
| `dotfiles cd` | Print chezmoi source path |
| `dotfiles secrets sync` | Fetch all secrets from Bitwarden SM, cache to `~/.config/secrets/env` |
| `dotfiles secrets list` | List secret names and IDs |
| `dotfiles secrets set KEY VALUE` | Create or update a secret |
| `dotfiles secrets rm KEY` | Delete a secret |
| `dotfiles secrets edit` | Open cached secrets file |

Shortcuts: `aliaz` (edit aliases), `aliazl` (edit local), `brefresh` (apply).

## What's included

- **zsh** -- oh-my-zsh with git plugin, pure prompt, fzf
- **Neovim** -- vim-plug, material-monokai, NERDTree, fzf, syntastic, airline, fugitive
- **tmux** -- `C-a` prefix, vi copy mode, mouse support, `|`/`-` splits
- **Git** -- aliases (`gs`, `gco`, `gpu`, `com`, `lg`), `git recentco` for branch switching
- **Tool inits** -- Homebrew, rbenv, pnpm (macOS only, skipped in devcontainers)
- **Docker/Rails aliases** -- `dc`, `dcup`, `dcdn`, `dsh`, `be`, `ber`, `rs`

## Local files (not tracked)

| File | Purpose |
|---|---|
| `~/.zshrc.local` | Machine-specific aliases, env vars, non-secret config |
| `~/.config/secrets/env` | Cached secrets from Bitwarden SM (chmod 600) |

## Secrets

Secrets are managed via [Bitwarden Secrets Manager](https://bitwarden.com/products/secrets-manager/) (`bws` CLI). The access token is stored in macOS Keychain under service `bws-access-token`. Run `dotfiles secrets sync` to fetch and cache them locally.

## Templating

Chezmoi templates (`.tmpl` files) handle:

- **OS detection** -- Homebrew/rbenv/pnpm only on macOS
- **Devcontainer detection** -- disables git fetch in pure prompt, adjusts paths
- **User config** -- name/email prompted on `chezmoi init`
