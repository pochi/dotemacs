# ================================
# Modern Zsh Configuration (2026)
# Optimized for development workflow
# ================================

# ===== Path Configuration =====

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# Python user scripts
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# ===== Environment Variables =====

# Default editor
export EDITOR="emacs -nw"
export VISUAL="emacs"

# AWS Configuration (credentials stored in ~/.aws/credentials)
export AWS_REGION=us-east-1
export CLAUDE_CODE_USE_BEDROCK=1

# Enable true color in terminal
export COLORTERM=truecolor

# Better history
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

# ===== Zsh Options =====

# History
setopt EXTENDED_HISTORY          # Write timestamp to history
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first
setopt HIST_IGNORE_DUPS          # Don't record duplicates
setopt HIST_IGNORE_SPACE         # Don't record commands starting with space
setopt HIST_VERIFY               # Show command with history expansion before running
setopt SHARE_HISTORY             # Share history between sessions

# Directory navigation
setopt AUTO_CD                   # cd by typing directory name
setopt AUTO_PUSHD                # Push directories onto stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicates
setopt PUSHD_SILENT              # Don't print directory stack

# Completion
setopt COMPLETE_IN_WORD          # Complete from both ends
setopt ALWAYS_TO_END             # Move cursor to end on completion
setopt AUTO_MENU                 # Show completion menu on tab
setopt AUTO_LIST                 # List choices on ambiguous completion

# ===== Modern CLI Tools =====

# fzf - Fuzzy finder
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
elif [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# fzf configuration
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
  --preview "bat --color=always --style=numbers --line-range=:500 {}"
  --preview-window=right:60%:wrap
'

# zoxide - Smarter cd
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# Starship - Modern prompt
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# atuin - Better shell history (optional, can be enabled later)
# if command -v atuin &> /dev/null; then
#   eval "$(atuin init zsh)"
# fi

# ===== Aliases =====

# Modern replacements for classic commands
if command -v eza &> /dev/null; then
  alias ls='eza --icons'
  alias ll='eza -l --icons --git'
  alias la='eza -la --icons --git'
  alias lt='eza --tree --level=2 --icons'
fi

if command -v bat &> /dev/null; then
  alias cat='bat --style=auto'
  alias less='bat --style=plain --paging=always'
fi

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Shortcuts
alias e='emacs -nw'
alias c='clear'
alias h='history'
alias zshrc='emacs ~/.zshrc'
alias reload='source ~/.zshrc && echo "Zsh config reloaded"'

# ripgrep with better defaults
if command -v rg &> /dev/null; then
  alias rg='rg --smart-case --hidden --glob "!.git"'
fi

# Safe operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# System info
alias myip='curl -s https://ifconfig.me'
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'

# Docker shortcuts (if using Docker)
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpa='docker ps -a'

# ===== Functions =====

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Find and cd into directory
fcd() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git | fzf --preview 'eza --tree --level=2 --icons {}')
  if [ -n "$dir" ]; then
    cd "$dir" || return
  fi
}

# Search in files and open in editor
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Usage: fif <search-term>"
    return 1
  fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "bat --style=numbers --color=always {} | rg --colors 'match:bg:yellow' --context 10 '$1'" | xargs -r $EDITOR
}

# Git branch checkout with fzf
gcof() {
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Kill process with fzf
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  if [ "x$pid" != "x" ]; then
    echo "$pid" | xargs kill -"${1:-9}"
  fi
}

# ===== Completion System =====

# Initialize completion
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colored completion (requires GNU ls or eza)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Menu-style completion
zstyle ':completion:*' menu select

# Group results by category
zstyle ':completion:*' group-name ''

# Describe options
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# Show warnings
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# ===== Key Bindings =====

# Emacs-style key bindings
bindkey -e

# Better history search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# Edit command line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# ===== tmux Integration =====

# Auto-start tmux (optional, commented out by default)
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach-session -t default || tmux new-session -s default
# fi

# ===== Performance =====

# Only compile .zshrc if it's newer than .zshrc.zwc
if [ ~/.zshrc -nt ~/.zshrc.zwc ] || [ ! -e ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

# ===== Welcome Message =====

# Show system info on new shell (optional)
# if command -v fastfetch &> /dev/null; then
#   fastfetch
# fi

# ===== Local Configuration =====

# Source local configuration if exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# ===== Notes =====

# Tools used in this configuration:
# - fzf: Fuzzy finder (brew install fzf)
# - eza: Modern ls replacement (brew install eza)
# - bat: Better cat with syntax highlighting (brew install bat)
# - ripgrep: Fast grep alternative (brew install ripgrep)
# - fd: Fast find alternative (brew install fd)
# - zoxide: Smarter cd (brew install zoxide)
# - starship: Modern prompt (brew install starship)
# - atuin: Better history (brew install atuin) [optional]
#
# Key shortcuts:
# - Ctrl+R: Search history with fzf
# - Ctrl+T: Search files with fzf
# - Alt+C: Search directories with fzf (cd into it)
# - z <dir>: Jump to directory (zoxide)
#
# Custom functions:
# - mkcd <dir>: Create and cd into directory
# - fcd: Fuzzy find and cd into directory
# - fif <term>: Find in files and open in editor
# - gcof: Git checkout branch with fzf
# - fkill: Kill process with fzf
