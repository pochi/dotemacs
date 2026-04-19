# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a terminal-first Emacs configuration optimized for Python, JavaScript/TypeScript, and Terraform development. The configuration uses modern built-in features (Emacs 29+) with minimal external dependencies. It was modernized from a 2017-2019 GUI setup to a 2026 LSP-enabled configuration.

## Architecture

### Modular Configuration System

The configuration uses a modular design with `init.el` as the entry point that loads individual modules from the `lisp/` directory. Each module is responsible for a specific domain:

**Core Modules** (loaded first):
- `init-elpa.el` - Package management with `use-package`
- `init-exec-path.el` - Environment PATH setup for terminal use
- `init-ui.el` - Terminal-first UI with modus-themes
- `init-clipboard.el` - System clipboard integration with CUA mode
- `init-navigation.el` - Projectile and window navigation
- `init-vertico.el` - Modern completion stack (Vertico/Consult/Marginalia/Orderless)
- `init-company-mode.el` - Code completion framework

**LSP and Language Support**:
- `init-eglot.el` - Unified LSP client (built-in eglot)
- `init-python.el` - Python with pyright LSP
- `init-web-mode.el` - JavaScript/TypeScript with typescript-language-server
- `init-terraform.el` - Terraform with terraform-ls
- `init-treesit.el` - Tree-sitter for syntax highlighting (Emacs 29+)

**Additional Modes**:
- `init-magit.el` - Git integration
- `init-org.el` - Org-mode setup
- `init-markdown.el` - Markdown support
- `init-helpful.el` - Enhanced help + avy + deadgrep

### Key Architectural Decisions

1. **Built-in First**: Prioritizes built-in Emacs 29+ features (eglot, use-package, modus-themes, tree-sitter) to reduce dependencies and improve reliability.

2. **Terminal-Optimized**: All features work seamlessly in terminal mode via SSH. Uses modus-themes (terminal-friendly), clipetty for OSC 52 clipboard, and xterm-mouse-mode.

3. **Unified LSP**: Single LSP client (eglot) replaces language-specific tools (anaconda-mode, racer, ensime). Configuration is in `init-eglot.el` with language-specific hooks in respective modules.

4. **Lightweight Completion**: Vertico stack (~2,500 lines) replaces Helm (~10,000 lines) for faster startup and lower memory usage.

5. **Lazy Loading**: Uses `use-package` `:defer`, `:hook`, and `:bind` for lazy loading to achieve <2 second startup time.

## Testing Configuration Changes

When modifying configuration files:

```bash
# Test configuration without affecting running Emacs
emacs -Q -l init.el

# Check startup time
emacs --eval '(message "Load time: %s" (emacs-init-time))' -nw

# View use-package loading report (inside Emacs)
M-x use-package-report

# Check for errors in *Messages* buffer
C-h e
```

## Language Server Prerequisites

Language servers must be installed separately:

```bash
# Python
pip install pyright

# JavaScript/TypeScript
npm install -g typescript typescript-language-server

# Terraform
brew install terraform-ls
# or download from: https://github.com/hashicorp/terraform-ls/releases
```

Verify installation:
```bash
which pyright
which typescript-language-server
which terraform-ls
```

## Common Tasks

### Adding New Language Support

1. Install language server
2. Create `lisp/init-<language>.el` following this pattern:
   ```elisp
   ;;; init-<language>.el --- <Language> support  -*- lexical-binding: t; -*-
   (require 'init-elpa)
   
   (use-package <language>-mode
     :ensure t
     :mode "\\.ext\\'")
   
   (provide 'init-<language>)
   ```
3. Add eglot hook in `init-eglot.el`:
   ```elisp
   :hook ((<language>-mode . eglot-ensure))
   ```
4. Add language server to `eglot-server-programs` in `init-eglot.el`
5. Add `(require 'init-<language>)` to `init.el`

### Debugging LSP Issues

1. Check eglot events: `M-x eglot-events-buffer`
2. Check flymake diagnostics: `M-x flymake-show-buffer-diagnostics`
3. Restart eglot: `M-x eglot-reconnect`
4. Enable event logging temporarily:
   ```elisp
   (setq eglot-events-buffer-size 2000000)
   ```

### Package Management

```elisp
;; Update package list
M-x package-refresh-contents

;; Upgrade all packages
M-x package-upgrade-all

;; Install specific package
M-x package-install RET <package-name>
```

## Important Patterns

### CUA Mode Integration

The `init-clipboard.el` module enables CUA mode for familiar clipboard operations. **Critical behavior**: C-c and C-x only act as copy/cut when a region is active. When no region is selected, they function as normal Emacs prefix keys (C-c for user commands, C-x for file operations).

When adding new C-c keybindings, they will work correctly because CUA mode only intercepts these keys when text is selected.

### Use-Package Declaration Order

Always follow this pattern for consistency:
```elisp
(use-package <package>
  :ensure t           ; or nil for built-in
  :defer t            ; optional: lazy load
  :hook (...)         ; auto-enable in modes
  :bind (...)         ; keybindings (also enables lazy load)
  :init (...)         ; before package loads
  :config (...))      ; after package loads
```

### Terminal vs GUI Checks

Use `(display-graphic-p)` to conditionally enable GUI-only features:
```elisp
(when (display-graphic-p)
  ;; GUI-only settings (fonts, etc.)
  )

(unless (display-graphic-p)
  ;; Terminal-only settings (mouse mode, etc.)
  )
```

## Deprecated/Removed Features

**Do not reintroduce these**:
- Helm (replaced by Vertico/Consult) - reason: too heavy, slower
- ido/smex (replaced by Vertico) - reason: Vertico handles all completion
- anaconda-mode (replaced by eglot + pyright) - reason: eglot is unified and built-in
- company-anaconda (replaced by company-capf) - reason: eglot provides completion via capf
- ensime (removed) - reason: project is dead; use metals for Scala if needed
- racer (removed) - reason: rust-analyzer is the modern standard
- doom-themes (replaced by modus-themes) - reason: better terminal support

These modules exist in `lisp/` but are stubbed:
- `init-helm.el` - kept for reference only
- `init-elpy.el` - kept for reference only
- `init-scala.el` - kept for reference only

## Troubleshooting

### Slow Startup
1. Check `M-x use-package-report` to find slow packages
2. Add `:defer t` to non-essential packages
3. Verify GC settings are correct (see `init.el` line 16)

### Clipboard Not Working in Terminal
1. Verify terminal supports OSC 52: `echo -en "\033]52;c;$(echo hello | base64)\a"`
2. Check tmux/screen passthrough is enabled
3. Restart Emacs with `global-clipetty-mode` enabled

### Theme Looks Wrong in Terminal
1. Check terminal color support: `echo $TERM` (should be `xterm-256color`)
2. Enable true color: `export COLORTERM=truecolor`
3. Try alternate modus theme: `M-x modus-themes-toggle` or `F5`

### LSP Not Starting
1. Verify language server is in PATH: `which <server-name>`
2. Check eglot configuration: `C-h v eglot-server-programs`
3. Review eglot events: `M-x eglot-events-buffer`
4. Check project root detection: `M-x projectile-project-root`
