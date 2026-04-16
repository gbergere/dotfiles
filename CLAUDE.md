# Dotfiles Repository

Personal dotfiles for macOS. All configuration is symlinked from this repo into `~` via the Makefile.

## Repo Structure

```
.
├── CLAUDE.md              ← This file (repo-level instructions)
├── Makefile               ← Symlink installer and setup tasks
├── Brewfile               ← Homebrew packages (tools, DevOps, vim linters)
├── .claude/               ← Claude Code global configuration
│   ├── CLAUDE.md          ← Global Claude instructions (symlinked to ~/.claude/)
│   ├── settings.json      ← Claude Code settings
│   └── skills/            ← Lazy-loaded skills (GIT, TERRAFORM, KUBERNETES, ISSUES, REFLECT)
├── .config/nvim/          ← Neovim configuration
├── .hammerspoon/          ← Hammerspoon window/app/keyboard automation
├── .vim/                  ← Vim configuration and plugins (Vundle)
├── .vimrc                 ← Vim entry point
├── .gitconfig             ← Global git configuration
├── .gitignore             ← Global gitignore
├── .editorconfig          ← Editor formatting rules
├── .yamllint              ← YAML linting rules
├── .tmux.conf             ← Tmux configuration
├── .zprofile              ← Zsh profile (aliases, history, tmux auto-attach)
├── .fzf.zsh              ← FZF integration for zsh
├── .synergy.conf          ← Synergy KVM configuration
└── Library/               ← macOS Library configs (Luacheck)
```

## How It Works

### Symlink Model
The `Makefile` target `init-home` symlinks files and directories from this repo into `~`. This means:
- Editing a file here updates the live config immediately (it's the same file via symlink)
- All dotfiles are version-controlled in this repo, not scattered across `~`

### Adding a New Dotfile
1. Add the file to this repo at its relative path (matching where it lives under `~`)
2. Add a `ln -svhf` line in the `Makefile` under `init-home`
3. If it requires a Homebrew package, add it to `Brewfile`

### Adding a New Claude Skill
1. Create a directory in `.claude/skills/<name>/` with a `SKILL.md` file
2. The `skills/` directory is symlinked — no Makefile change needed
3. Skills are lazy-loaded: Claude auto-invokes them when relevant, or you can invoke manually via `/<name>`

### Adding a New Brew Package
1. Add the entry to `Brewfile` under the appropriate section (Tools, DevOps, Vim linters)
2. `brew bundle` runs automatically during `init-home`

## Makefile Targets

| Target            | Purpose                                              |
|-------------------|------------------------------------------------------|
| `init-home`       | Default. Symlinks all dotfiles and runs `brew bundle` |
| `install-brew`    | Installs Homebrew itself (first-time setup)           |
| `install-vim-dep` | Installs Vundle and Luacheck for Vim linting          |

## Conventions

- **README.md** documents setup instructions and what's included for a human audience. Keep it in sync when adding new dotfiles or Makefile targets.
- **Symlinks use `-svhf`**: symbolic, verbose, no-dereference (treat symlink target as file), force overwrite.
- **Brewfile sections**: Tools, DevOps, Vim linters — keep new entries in the right section.
- **Main branch**: `main` (remote default is `master` historically — PRs target `master`).
