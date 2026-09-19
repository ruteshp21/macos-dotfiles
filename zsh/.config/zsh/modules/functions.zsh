## -----------------------------------------------------------------------------
## ZSH FUNCTIONS
##
## Custom functions for your interactive shell.
## -----------------------------------------------------------------------------

# Git commit with a message (handles spaces properly without requiring quotes)
function gc { git commit -m "$@"; }

# Create a new directory and enter it
function mkd() {
  mkdir -p "$1" && cd "$1"
}

# Universal extractor for archives
function extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.tar.xz)    tar xJf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *.xz)        unxz "$1"       ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Fuzzy find a process and kill it using fzf
function fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

# Kill process running on a specified port (e.g., killport 8080)
function killport() {
  if [[ -z "$1" ]]; then
    echo "Usage: killport <port_number>"
    return 1
  fi
  lsof -i TCP:"$1" | awk 'NR!=1 {print $2}' | xargs kill -9 2>/dev/null
  echo "Killed process(es) on port $1."
}

# Fuzzy search file contents using ripgrep, fzf, and bat
function fs() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
        --delimiter : \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
        --preview-window '+{2}+3/3,~3'
}
