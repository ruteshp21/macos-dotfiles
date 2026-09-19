# =============================================================================
# Brewfile — managed with `brew bundle`
# Run:  brew bundle --file=~/.dotfiles/Brewfile
# =============================================================================

# --- Taps --------------------------------------------------------------------
tap "localstack/tap"

# --- Core CLI Utilities ------------------------------------------------------
brew "bat"                          # cat replacement with syntax highlighting
brew "curl"                         # Command-line tool for transferring data with URLs
brew "curlie"                       # Power of curl, ease of use of httpie
brew "direnv"                       # Load/unload environment variables based on \$PWD
brew "eza"                          # Modern, maintained replacement for ls
brew "fd"                           # Simple, fast and user-friendly alternative to find
brew "fzf"                          # Command-line fuzzy finder written in Go
brew "fzf-tab"                      # Replace zsh completion selection menu with fzf
brew "htop"                         # Interactive process viewer
brew "procs"
brew "jq"                           # Lightweight and flexible command-line JSON processor
brew "mas"                          # Mac App Store command-line interface
brew "opencode"                     
brew "pass"                         # The standard unix password manager
brew "ripgrep"                      # Fast grep replacement (rg)
brew "rsync"                        # Utility for fast incremental file transfer
brew "stow"                         # Symlink manager for dotfiles
brew "tldr"                         # Simplified, community-driven man pages
brew "tmux"                         # Terminal multiplexer
brew "tree"                         # Display directories as trees (with color)
brew "wget"                         # Internet file retriever
brew "xz"                           # General-purpose data compression
brew "yq"                           # YAML, JSON, XML, CSV processor
brew "zoxide"                       # Smarter cd command (z)

# --- Archive Tools (CLI & GUI) -----------------------------------------------
brew "sevenzip"                     # 7-Zip file archiver (CLI)
cask "keka"                         # File archiver (GUI)

# --- Development & Git Tools -------------------------------------------------
brew "asciinema"                    # Record and share terminal sessions
brew "git"                          # Distributed revision control system
brew "git-delta"                    # Syntax-highlighting pager for git diffs
brew "git-lfs"                      # Git extension for versioning large files
brew "gh"                           # GitHub CLI
brew "ghq"
brew "lazygit"                      # Simple terminal UI for git commands
brew "mkcert"                       # Simple tool to make locally trusted dev certificates
brew "neovim"                       # Modern Vim-fork focused on extensibility
cask "fork"                         # Fast and clean Git client
cask "github"                       # GitHub Desktop

# --- Shell Configuration & Plugins -------------------------------------------
brew "starship"                     # Cross-shell prompt for astronauts
brew "zsh"                          # Programmable command interpreter
brew "zsh-autosuggestions"          # Fish-like fast/unobtrusive autosuggestions
brew "zsh-completions"              # Additional completion definitions for zsh
brew "zsh-history-substring-search" # Zsh port of Fish shell's history search
brew "zsh-syntax-highlighting"      # Fish shell-like syntax highlighting
brew "zsh-you-should-use"           # Reminder to use existing aliases

# --- Languages & Package Managers --------------------------------------------
# Python
brew "uv"                           # Extremely fast Python package installer/resolver

# Node / JS
brew "fnm"                          # Manage multiple Node.js versions
brew "pnpm"                         # Fast, disk space efficient package manager
brew "yarn"                         # JavaScript package manager

# --- Java Development & Environment -----------------------------------------
brew "jenv"                         # Manage multiple Java versions easily
cask "corretto@17"                  # Amazon Corretto JDK 17 (LTS)
cask "corretto@21"                  # Amazon Corretto JDK 21 (LTS)
cask "corretto@25"                  # Amazon Corretto JDK 25 (LTS)
cask "corretto"                     # Amazon Corretto JDK 26 (Latest/Feature Release)

# --- DevOps & Infrastructure -------------------------------------------------
brew "awscli"                        # Official Amazon AWS command-line interface
brew "localstack/tap/localstack-cli" # Local AWS emulation engine CLI
brew "tenv"                          # Version manager for OpenTofu / Terraform / Terragrunt

# --- Kubernetes --------------------------------------------------------------
brew "helm"                         # Kubernetes package manager
brew "k3d"                          # Run CNCF's k3s in Docker
brew "k9s"                          # Terminal UI to manage Kubernetes clusters
brew "kubectx"                      # Switch between kubectl contexts and namespaces easily
brew "kubernetes-cli"               # Kubernetes command-line interface (kubectl)
brew "stern"                        # Tail multiple Kubernetes pods & their containers

# --- Fonts -------------------------------------------------------------------
cask "font-fira-code-nerd-font"
cask "font-hack-nerd-font"
cask "font-jetbrains-mono-nerd-font"
cask "font-meslo-lg-nerd-font"      # Recommended for Zsh prompts

# --- Editors & IDEs ----------------------------------------------------------
cask "intellij-idea"
cask "visual-studio-code"
cask "kdiff3"

# --- Terminal & Remote Access ------------------------------------------------
cask "iterm2"
cask "windows-app"                  # Remote access to Windows

# --- Database Clients --------------------------------------------------------
cask "dbeaver-community"            # Universal database tool
cask "tableplus"                    # Relational database GUI

# --- API Clients & Networking ------------------------------------------------
cask "bruno"                        # Open source IDE for exploring and testing APIs
cask "ngrok"                        # Reverse proxy for secure local tunnels

# --- Containers & File Transfer ----------------------------------------------
cask "cyberduck"                    # FTP, SFTP, WebDAV, S3 browser
cask "docker-desktop"               # Build and share containerised applications

# --- Productivity & System Tools ---------------------------------------------
cask "appcleaner"                   # Thoroughly uninstall apps
cask "betterdisplay"                # Display management and custom resolutions
cask "keycastr"                     # Keystroke visualizer
cask "maccy"                        # Clipboard manager
cask "raycast"                      # Spotlight replacement
cask "rectangle"                    # Window manager
cask "shottr"                       # Screenshot measurement and annotation tool
mas "Yoink - Better Drag and Drop", id: 457622435

# --- QuickLook Plugins -------------------------------------------------------
cask "qlmarkdown"                   # Preview Markdown files in QuickLook
cask "syntax-highlight"             # Preview source code files with syntax highlighting

# --- Browsers & Cloud Storage ------------------------------------------------
cask "google-chrome"
cask "google-drive"

# --- Notes & Communication ---------------------------------------------------
cask "notion"
cask "obsidian"
cask "zoom"

# --- Media & Entertainment ---------------------------------------------------
cask "jellyfin-media-player"
cask "spotify"
cask "transmission"                 # Open-source BitTorrent client
cask "vlc"

# --- VS Code Extensions (managed via brew bundle) ----------------------------
vscode "catppuccin.catppuccin-vsc"
vscode "catppuccin.catppuccin-vsc-icons"
vscode "dbaeumer.vscode-eslint"
vscode "esbenp.prettier-vscode"
vscode "ms-azuretools.vscode-containers"
vscode "ms-vscode-remote.remote-containers"
vscode "ms-python.python"
vscode "ms-toolsai.jupyter"
vscode "ms-kubernetes-tools.vscode-kubernetes-tools"

# --- Post-Install Java Automation --------------------------------------------
system "jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home/ >/dev/null 2>&1 || true"
system "jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home/ >/dev/null 2>&1 || true"
system "jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-25.jdk/Contents/Home/ >/dev/null 2>&1 || true"
system "jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-26.jdk/Contents/Home/ >/dev/null 2>&1 || true"
