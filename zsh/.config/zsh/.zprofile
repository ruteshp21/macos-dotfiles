## -----------------------------------------------------------------------------
## ZSH LOGIN SHELL (.zprofile)
##
## Loaded only for login shells, after .zshenv.
## Ideal for running commands that should only execute once per session.
## -----------------------------------------------------------------------------

# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:$HOME/.docker/bin:$HOME/.jenv/bin"

# End of Docker Desktop section.

## -----------------------------------------------------------------------------
## HOMEBREW
## -----------------------------------------------------------------------------
# Initialize Homebrew for Apple Silicon Macs.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi
