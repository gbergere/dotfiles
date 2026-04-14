# Dotfiles

Personal macOS dotfiles. All configuration is symlinked from this repo into `~` via a single `make` command.

## Prerequisites

- macOS
- [Homebrew](https://brew.sh)
- Git

## Setup

```bash
# Clone
git clone git@github.com:gbergere/dotfiles.git ~/Git/gbergere/dotfiles
cd ~/Git/gbergere/dotfiles

# Install Homebrew (if not already installed)
make install-brew

# Symlink everything and install packages
make
```

This will:
- Symlink all dotfiles into `~`
- Install Homebrew packages from `Brewfile`

### Vim Plugins

```bash
make install-vim-dep
```

Installs [Vundle](https://github.com/VundleVim/Vundle.vim) and [Luacheck](https://github.com/mpeterv/luacheck) for Vim/Neovim linting.

## What's Included

### Shell
- **Zsh** (`.zprofile`) — aliases, history config, auto-attach to tmux session
- **FZF** (`.fzf.zsh`) — fuzzy finder integration
- **Tmux** (`.tmux.conf`) — terminal multiplexer config

### Editors
- **Neovim** (`.config/nvim/`) — Lua-based config with LSP support
- **Vim** (`.vimrc`, `.vim/`) — Vundle plugins, linters, aliases

### Git
- **`.gitconfig`** — global git settings
- **`.gitignore`** — global ignore patterns
- **`.editorconfig`** — consistent formatting across editors

### macOS Automation
- **Hammerspoon** (`.hammerspoon/`) — window management, app shortcuts, keyboard automation

### DevOps Tools (via Brewfile)
- `awscli`, `google-cloud-sdk`, `terraform`, `tflint`
- `kubernetes-cli`, `packer`, `jsonnet`
- `gh`, `git-lfs`, `jq`, `rg`

### Claude Code
- Global instructions (`.claude/CLAUDE.md`)
- Engineering standards (`.claude/rules/`) — Git, Terraform, Kubernetes, Issues
- Prompt hooks (`.claude/hooks/`)

### Linting
- **ShellCheck** — shell script linting
- **yamllint** (`.yamllint`) — YAML linting rules
- **TFLint** — Terraform linting

## Makefile Targets

| Target            | Purpose                                               |
|-------------------|-------------------------------------------------------|
| `make`            | Symlink all dotfiles and install Homebrew packages    |
| `make install-brew` | Install Homebrew (first-time setup)                 |
| `make install-vim-dep` | Install Vundle and Luacheck for Vim linting      |
