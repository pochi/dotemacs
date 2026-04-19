# dotfiles

Modern dotfiles for terminal-based development (2026). Optimized for Emacs, tmux, and zsh on macOS.

## Overview

A curated collection of configuration files for efficient terminal-based development:

- **Emacs** - Terminal-first configuration with LSP support (Python, TypeScript, Terraform)
- **tmux** - Emacs-friendly multiplexer configuration
- **zsh** - Modern shell with fzf, eza, bat, and other CLI tools
- **Starship** - Beautiful, fast prompt
- **Ghostty** - Modern terminal emulator settings

## Features

### Emacs
- 🚀 Fast startup (<2 seconds)
- 🔧 LSP support via eglot (built-in Emacs 29+)
- 🎨 Terminal-optimized with modus-themes
- 📋 System clipboard integration (works over SSH via OSC 52)
- 🔍 Modern completion with Vertico/Consult stack
- ⌨️ Cmd+c/v/x for clipboard operations (macOS)
- 🐍 Python (pyright), TypeScript, Terraform support

### tmux
- ⌨️ Emacs-friendly prefix (C-t instead of C-b)
- 🖱️ Mouse support
- 📋 Clipboard integration via OSC 52
- 🎨 Beautiful status bar matching modus-vivendi theme
- ⚡ Fast escape time for Emacs

### zsh
- 🔍 fzf for fuzzy finding (Ctrl+R, Ctrl+T)
- 📁 zoxide for smart directory jumping
- 🎨 Modern ls with eza (icons, git status)
- 📄 Syntax highlighting with bat
- 🚀 Starship prompt (git status, python env, etc.)
- ⚡ Fast grep/find with ripgrep and fd

## Prerequisites

- macOS (tested on macOS 15+)
- Emacs 29+ (built-in tree-sitter, eglot)
- Homebrew
- Git

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/pochi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Install required tools

```bash
# Install Homebrew if not installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install CLI tools
brew install fzf eza bat ripgrep fd zoxide starship tmux

# Install language servers
pip install pyright
npm install -g typescript typescript-language-server
brew install terraform-ls

# Optional: Install Ghostty terminal
brew install --cask ghostty
```

### 3. Backup existing configs

```bash
mv ~/.emacs.d ~/.emacs.d.backup
mv ~/.tmux.conf ~/.tmux.conf.backup
mv ~/.zshrc ~/.zshrc.backup
```

### 4. Create symlinks

```bash
# Emacs
ln -s ~/.dotfiles ~/.emacs.d

# tmux
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# zsh
ln -s ~/.dotfiles/zshrc ~/.zshrc

# Starship
mkdir -p ~/.config
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml

# Ghostty
mkdir -p ~/.config/ghostty
ln -s ~/.dotfiles/ghostty.config ~/.config/ghostty/config
```

### 5. Install Emacs packages

```bash
emacs
# Packages will auto-install on first launch
# Wait for completion, then restart Emacs
```

### 6. Install tmux plugins

```bash
# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start tmux
tmux

# Install plugins: Press C-t I (prefix + Shift+i)
```

### 7. Setup fzf key bindings

```bash
$(brew --prefix)/opt/fzf/install
```

### 8. Reload shell

```bash
source ~/.zshrc
```

## Key Bindings

### Emacs

**Clipboard:**
- `Cmd+c` / `M-w` - Copy
- `Cmd+v` / `C-y` - Paste
- `Cmd+x` / `C-w` - Cut

**File Navigation:**
- `M-s f` - Find file (current directory)
- `C-c p f` - Find file (project)
- `M-s l` - Search in current file
- `M-s r` - Ripgrep search
- `C-x b` - Switch buffer

**LSP:**
- `M-.` - Jump to definition
- `M-,` - Jump back
- `C-c l r` - Rename
- `C-c l a` - Code actions
- `C-c l f` - Format buffer

**Git:**
- `C-x g` - Magit status

### tmux

- `C-t` - Prefix key (instead of C-b)
- `C-t |` - Split horizontal
- `C-t -` - Split vertical
- `C-t h/j/k/l` - Navigate panes
- `Shift+Arrow` - Navigate windows
- `C-t r` - Reload config

### zsh

- `Ctrl+R` - Search history (fzf)
- `Ctrl+T` - Find files (fzf)
- `z <dir>` - Jump to directory (zoxide)
- `fcd` - Fuzzy cd
- `fif <term>` - Find in files
- `gcof` - Git checkout branch (fzf)

## File Structure

```
.
├── init.el                 # Emacs entry point
├── lisp/                   # Emacs configuration modules
│   ├── init-clipboard.el   # Clipboard integration
│   ├── init-eglot.el      # LSP configuration
│   ├── init-vertico.el    # Completion framework
│   ├── init-python.el     # Python support
│   └── ...
├── tmux.conf              # tmux configuration
├── zshrc                  # zsh configuration
├── starship.toml          # Starship prompt
├── ghostty.config         # Ghostty terminal
├── CLAUDE.md              # AI assistant guidance
└── MODERNIZATION.md       # Migration notes

```

## Language Support

### Python
- LSP: pyright
- Virtual env: pyvenv, pyenv-mode
- Formatting: eglot-format
- Auto-imports: eglot organize-imports

### JavaScript/TypeScript
- LSP: typescript-language-server
- Formatting: eglot-format
- Tree-sitter syntax highlighting

### Terraform
- LSP: terraform-ls
- Formatting: eglot-format
- Validation on save

## Customization

### Emacs
Edit files in `~/.emacs.d/lisp/` or create `~/.emacs.d/lisp/init-custom.el`

### zsh
Create `~/.zshrc.local` for local overrides:

```bash
# ~/.zshrc.local
export CUSTOM_VAR=value
alias myalias='command'
```

### tmux
Edit `~/.tmux.conf` directly or source additional configs

## Troubleshooting

### Emacs startup errors
```bash
emacs --debug-init
```

### LSP not working
```bash
# Check language server installation
which pyright typescript-language-server terraform-ls

# Check eglot events
M-x eglot-events-buffer
```

### Clipboard not working in tmux
1. Ensure tmux config has OSC 52 settings
2. Restart terminal and tmux
3. Check Ghostty clipboard settings

### Slow shell startup
```bash
# Profile zsh startup
time zsh -i -c exit

# Check slow plugins
```

## Architecture

See [CLAUDE.md](CLAUDE.md) for detailed architecture and development guidance.

See [MODERNIZATION.md](MODERNIZATION.md) for migration history and decisions.

## Credits

- Emacs configuration inspired by modern best practices (2026)
- Built with minimal external dependencies
- Uses built-in Emacs 29+ features (eglot, use-package, tree-sitter)

## License

MIT License - Feel free to use and modify as needed.

## Contributing

This is a personal dotfiles repository, but feel free to open issues or PRs with suggestions!

---

**Maintained for:** Terminal-based development on macOS
**Last updated:** 2026-04-19
