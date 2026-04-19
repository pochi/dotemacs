# Clipboard Integration Guide

## Overview

Emacs now supports familiar clipboard operations with `C-c`, `C-v`, and `C-x` through CUA mode, while maintaining full Emacs functionality.

## How It Works

### CUA Mode (Smart Behavior)

**When region is active (text selected):**
- `C-c` → Copy to clipboard
- `C-x` → Cut to clipboard
- `C-v` → Paste from clipboard

**When region is NOT active:**
- `C-c` → Normal Emacs prefix key (e.g., `C-c C-c`, `C-c l r`)
- `C-x` → Normal Emacs prefix key (e.g., `C-x b`, `C-x s`)
- `C-v` → Scroll down (page down)

**This means:**
- All Emacs key bindings still work normally!
- `C-c` and `C-x` become copy/cut ONLY when you select text
- No conflicts with Emacs commands like `C-x b` or `C-c l r`

## Usage Examples

### Copy Text
```
1. Select text (with mouse or Shift+Arrow or C-Space + movement)
2. Press C-c
3. Text is copied to system clipboard
```

### Cut Text
```
1. Select text
2. Press C-x
3. Text is cut to system clipboard
```

### Paste Text
```
1. Press C-v
2. Text is pasted from system clipboard
```

### Mouse Selection
```
Click and drag to select → Automatically copied to clipboard
```

## Alternative Key Bindings

If CUA keys conflict with your workflow, use these instead:

| Action | Mac | Linux/Windows |
|--------|-----|---------------|
| Copy | `Cmd+c` | `Super+c` |
| Cut | `Cmd+x` | `Super+x` |
| Paste | `Cmd+v` | `Super+v` |

## Traditional Emacs Keys Still Work

All traditional Emacs clipboard operations remain available:

| Emacs Command | Key | Description |
|---------------|-----|-------------|
| kill-region | `C-w` | Cut (kill) |
| kill-ring-save | `M-w` | Copy (save to kill ring) |
| yank | `C-y` | Paste (yank) |
| yank-pop | `M-y` | Cycle through kill ring |

## System Clipboard Integration

- ✅ Works in GUI Emacs
- ✅ Works in terminal Emacs (via OSC 52)
- ✅ Works over SSH
- ✅ Works in tmux
- ✅ Integrates with macOS/Linux/Windows clipboard

## Visual Feedback

When you copy text, the selected region briefly pulses to confirm the operation.

## Tips

### Select Text with Keyboard
```
C-Space         # Start selection
(move cursor)   # Extend selection
C-c             # Copy
```

### Select Entire Buffer
```
C-x h           # Select all
C-c             # Copy
```

### Rectangular Selection
```
C-x Space       # Enter rectangle mode
(move cursor)   # Select rectangle
C-c             # Copy rectangle
```

### Paste Multiple Times
```
C-c             # Copy
C-v             # Paste
C-v             # Paste again
C-v             # Paste again (unlimited)
```

## Troubleshooting

### "C-c doesn't copy"
- Make sure text is selected first
- Try selecting with mouse or Shift+Arrow
- Check if region is highlighted

### "C-v doesn't paste"
- Try `C-y` (traditional Emacs paste)
- Try `Cmd+v` (macOS) or `Super+v` (Linux)
- Check if clipboard has content

### "CUA mode conflicts with my bindings"
Disable CUA mode and use alternative bindings:
```elisp
;; In init-clipboard.el
(cua-mode -1)  ; Disable CUA

;; Use Super/Cmd keys instead
Cmd+c  ; Copy
Cmd+v  ; Paste
Cmd+x  ; Cut
```

## Configuration Location

- Main config: `lisp/init-clipboard.el`
- Loaded automatically via `init.el`
- Uses `cua-mode` (built-in Emacs feature)

## Benefits

1. **Familiar to new users**: Standard C-c/C-v/C-x keys
2. **No conflicts**: Smart behavior preserves Emacs bindings
3. **System integration**: Works with all system clipboard
4. **Visual feedback**: Pulse effect confirms operations
5. **Flexible**: Multiple ways to copy/paste

Enjoy seamless clipboard operations! 📋✨
