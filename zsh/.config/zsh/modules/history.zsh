## -----------------------------------------------------------------------------
## ZSH HISTORY CONFIGURATION
##
## Configures the behavior of the Zsh command history.
## The location of the history file itself is set in .zshenv via $HISTFILE.
## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
## HISTORY SIZE
## -----------------------------------------------------------------------------
HISTSIZE=100000
SAVEHIST=100000

## -----------------------------------------------------------------------------
## HISTORY OPTIONS
## -----------------------------------------------------------------------------

setopt SHARE_HISTORY          # Share history across all terminals
setopt APPEND_HISTORY         # Append to history file instead of overwriting
setopt INC_APPEND_HISTORY     # Immediately append commands to history
setopt EXTENDED_HISTORY       # Save timestamp and duration with history entries

setopt HIST_IGNORE_DUPS       # Ignore consecutive duplicate commands
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicates from the history file
setopt HIST_IGNORE_SPACE      # Ignore commands that start with a space
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks from history entries

setopt HIST_VERIFY            # Verify history expansions before executing
