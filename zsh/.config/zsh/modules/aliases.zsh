# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ~='cd ~'

# Common
alias hello='echo Hello World'
alias zshrc='$EDITOR $ZDOTDIR/.zshrc'
alias src='source $ZDOTDIR/.zshrc'
alias updatepkg='brew update && brew upgrade'
alias myip='curl http://ipecho.net/plain; echo'
alias dirs='dirs -v | head -10'
alias usage='du -h -d1'
alias sshdir='cd ~/.ssh'
alias runp='lsof -i '
alias md='mkdir'
alias c='clear'
alias q='exit'
alias x='exit'
alias ports='lsof -i -P -n | grep LISTEN'

# Eza (Modern ls replacement)
alias ls='eza --icons'
alias l='eza -l --icons'
alias la='eza -a --icons'
alias lla='eza -la --icons'
alias lt='eza --tree --icons'

# Modern CLI Tools
alias cat='bat'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias lg='lazygit'
alias grep='rg'
alias find='fd'
alias top='htop'

# Kubernetes
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'
alias kgp='kubectl get pods'
alias kdp='kubectl describe pod'
alias klogs='kubectl logs'

# History
alias h='history'
alias hs='history | grep'
alias hsi='history | grep -i'

# Docker
alias d='docker'
alias dco='docker compose'
alias docker-stop='docker compose stop'
alias docker-restart='docker compose restart'
alias docker-up='docker compose up -d'
alias docker-rm='docker compose rm --all'
alias docker-build='docker compose build'

# Tmux
alias ta='tmux attach -t'
alias tn='tmux new-session -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# Git Bare
alias gdf='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias gdfa='gdf add'
alias gdfc='gdf commit -m'
alias gdfp='gdf push'

## git aliases

alias gcm='git checkout main'       # Checkout the main branch
alias gcs='git checkout master'     # Checkout the master branch (legacy)
alias gs='git status'
alias gpull='git pull'
alias gpush='git push'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfo='git fetch origin'
alias gd='git diff'
alias ga='git add .'
alias gb='git branch'
alias gbr='git branch -r'           # List remote branches
alias gfr='git remote update'
alias gbn='git checkout -B '
alias grf='git reflog'
alias grh='git reset HEAD~'         # Undo last commit
alias gac='git add . && git commit -a -m '
alias gsu='git push --set-upstream origin '
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

# npm
alias ni='npm install'
alias nrs='npm run start -s --'
alias nrb='npm run build -s --'
alias nrd='npm run dev -s --'
alias nrt='npm run test -s --'
alias nrtw='npm run test:watch -s --'
alias nrv='npm run validate -s --'
alias rmn='rm -rf node_modules'
alias flush-npm='rm -rf node_modules && npm i && echo NPM is done'

# pnpm
alias pni='pnpm install'
alias pnd='pnpm dev'
alias pnb='pnpm build'
alias pnx='pnpm dlx'

# Python (uv)
alias py='python3'
alias pyv='uv venv'
alias pip='uv pip'
alias pi='uv pip install'
