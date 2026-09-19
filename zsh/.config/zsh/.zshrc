## -----------------------------------------------------------------------------
## ZSH INTERACTIVE SHELL (.zshrc)
##
## Loaded for interactive shells, after .zshenv and .zprofile.
## Used for configuring prompt, aliases, plugins, and interactive tools.
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## ZSH OPTIONS
## -----------------------------------------------------------------------------
setopt interactivecomments # Allow comments in interactive shell
setopt correct             # Correct minor command typos
setopt noclobber           # Don't overwrite files with >

## -----------------------------------------------------------------------------
## COMPLETIONS & STYLING
## -----------------------------------------------------------------------------
zstyle ':completion:*' menu select # selectable menu
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*' # case-insensitive completion
zstyle ':completion:*' special-dirs true # complete . and .. special directories
zstyle ':completion:*' list-colors '' # colorize completion lists
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01' # colorize kill list

# Add Homebrew completions to fpath before compinit
fpath=("$HOMEBREW_PREFIX/share/zsh-completions" $fpath)

# Initialize the completion system
autoload -Uz compinit
local zcompdump_file="$XDG_CACHE_HOME/zsh/.zcompdump"

# If the dump file doesn't exist or is older than 24 hours, regenerate it
if [[ ! -f "$zcompdump_file" || -z "$zcompdump_file"(#qN.mh+24) ]]; then
  compinit -i -d "$zcompdump_file"
else
  # Otherwise, load from the cached dump file
  compinit -C -i -d "$zcompdump_file"
fi

## -----------------------------------------------------------------------------
## MODULAR CONFIGURATION
## -----------------------------------------------------------------------------
[[ -f "$ZDOTDIR/modules/history.zsh" ]] && source "$ZDOTDIR/modules/history.zsh"
[[ -f "$ZDOTDIR/modules/aliases.zsh" ]] && source "$ZDOTDIR/modules/aliases.zsh"
[[ -f "$ZDOTDIR/modules/plugins.zsh" ]] && source "$ZDOTDIR/modules/plugins.zsh"
[[ -f "$ZDOTDIR/modules/functions.zsh" ]] && source "$ZDOTDIR/modules/functions.zsh"
[[ -f "$ZDOTDIR/modules/keybindings.zsh" ]] && source "$ZDOTDIR/modules/keybindings.zsh"

## -----------------------------------------------------------------------------
## ZSH SYNTAX HIGHLIGHTING CONFIGURATION
## -----------------------------------------------------------------------------
# Remove bold from commands, builtins, and aliases
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[function]='fg=green'

# Remove bold from error/unknown commands (makes them just red)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

## -----------------------------------------------------------------------------
## TOOL INITIALIZATIONS
## -----------------------------------------------------------------------------
# Zoxide (Better cd)
eval "$(zoxide init zsh)"

# Direnv (Per-directory environments)
eval "$(direnv hook zsh)"

# NVM (Node Version Manager)
export NVM_DIR="$XDG_DATA_HOME/nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# Starship Prompt - MUST BE LOADED LAST
eval "$(starship init zsh)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/rutesh/.docker/completions $fpath)
autoload -Uz compinit
(( ${+_comps[docker]} )) || compinit
# End of Docker CLI completions

eval "$(jenv init -)"