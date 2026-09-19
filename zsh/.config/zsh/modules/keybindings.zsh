## -----------------------------------------------------------------------------
## ZSH KEYBINDINGS
##
## Custom key mappings for terminal navigation and commands.
## -----------------------------------------------------------------------------

# -----------------------------------------
# MAC-NATIVE BEHAVIOR
# -----------------------------------------
# Enforce emacs mode to keep standard Mac shortcuts (Ctrl+A, Ctrl+E, Ctrl+K)
# Otherwise, Zsh defaults to vi mode because EDITOR=nvim is set in .zshenv
bindkey -e

# Edit the current command line in your $EDITOR (Press Ctrl+X, then Ctrl+E)
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# -----------------------------------------
# HISTORY SEARCH
# -----------------------------------------
# Use substring search plugin keybindings (Up/Down arrows)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# -----------------------------------------
# WORD NAVIGATION
# -----------------------------------------
# Option + Left / Right (standard macOS terminal behavior)
bindkey '^[b' backward-word
bindkey '^[f' forward-word

# Option + Backspace (delete word backwards)
bindkey '^[^?' backward-kill-word

# Option + Delete (delete word forwards)
bindkey '^[d' kill-word

# -----------------------------------------
# HOME / END KEYS (Fn + Left / Fn + Right)
# -----------------------------------------
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line

# -----------------------------------------
# INLINE COMMANDS
# -----------------------------------------
bindkey -s "^h" "history 1\n"
bindkey -s "^l" "clear\n"
bindkey -s "^d" "dlfile\n"
