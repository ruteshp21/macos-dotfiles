## -----------------------------------------------------------------------------
## ZSH ENVIRONMENT (.zshenv)
##
## Loaded on EVERY shell invocation (interactive and non-interactive).
## Used for setting essential, universal environment variables and the PATH.
## -----------------------------------------------------------------------------

# Prevent duplicate entries in the PATH array.
typeset -U PATH path

## -----------------------------------------------------------------------------
## XDG BASE DIRECTORY SPECIFICATION
##
## Standardizes paths for configuration, data, and cache files.
## See: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
## -----------------------------------------------------------------------------
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

## -----------------------------------------------------------------------------
## ZSH-SPECIFIC ENVIRONMENT
##
## Configure Zsh's own environment variables, respecting XDG paths.
## -----------------------------------------------------------------------------
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/.zsh_history"

## -----------------------------------------------------------------------------
## APPLICATION & TOOL ENVIRONMENT
##
## Configure environment variables for various command-line tools.
## -----------------------------------------------------------------------------

# --- Editors ---
export EDITOR="nvim"
export VISUAL="code"

# --- Node.js Ecosystem ---
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export YARN_CACHE_FOLDER="$XDG_CACHE_HOME/yarn"

## -----------------------------------------------------------------------------
## PATH CONSTRUCTION
##
## The PATH variable is constructed here, prepending custom directories.
## Homebrew's path is added separately via .zprofile.
## -----------------------------------------------------------------------------
path=(
  # Homebrew Path
  /opt/homebrew/bin
  /opt/homebrew/sbin
  # Node.js package managers
  "$PNPM_HOME"
  # User-specific scripts and binaries
  "$HOME/.local/scripts"
  "$HOME/.local/bin"
  # System binaries (less common, but sometimes needed)
  /usr/local/sbin
  # Original system path
  $path
)
export PATH

## -----------------------------------------------------------------------------
## NODE VERSION MANAGER (FNM)
## -----------------------------------------------------------------------------
if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi
