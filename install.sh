#!/usr/bin/env bash
set -euo pipefail

################################
# Prevent sleep during setup
################################
caffeinate -dimsu &
CAFFEINATE_PID=$!

################################
# Create base directories
################################
create_dirs() {
  echo "🗄  Creating directories"

  dirs=(
    "$HOME/.cache"
    "$HOME/.config"
    "$HOME/.local/bin"
    "$HOME/.local/scripts"
    "$HOME/Downloads/torrents"
    "$HOME/Codespace"
  )

  for dir in "${dirs[@]}"; do
    mkdir -p "$dir"
  done
}

################################
# Install Xcode CLI Tools
################################
install_xcode_cli() {
  echo "🛠  Checking Xcode Command Line Tools"

  if ! xcode-select --print-path &>/dev/null; then
    xcode-select --install

    until xcode-select --print-path &>/dev/null; do
      sleep 5
    done

    sudo xcodebuild -license accept
  fi
}

################################
# Install Rosetta (Apple Silicon)
################################
install_rosetta() {
  if [[ "$(uname -m)" == "arm64" ]]; then
    if ! pgrep oahd >/dev/null 2>&1; then
      echo "🔧 Installing Rosetta"
      sudo softwareupdate --install-rosetta --agree-to-license
    fi
  fi
}

################################
# Install Homebrew
################################
install_brew() {
  echo "🍺 Installing Homebrew"

  if ! command -v brew &>/dev/null; then
    echo "Homebrew not found, installing..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  echo "Disabling Homebrew analytics"
  brew analytics off

  echo "Updating Homebrew"
  brew update

  if [[ -f Brewfile ]]; then
    echo "Installing Brewfile packages"
    brew bundle
  fi

}

################################
# Apply macOS defaults
################################
apply_macos_defaults() {
  echo "💻 Applying macOS preferences"

  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  if [[ -f "$SCRIPT_DIR/macos.sh" ]]; then
    "$SCRIPT_DIR/macos.sh"
  fi
}

################################
# Adding ZSH Plugins
################################
add_zsh_plugins() {
  echo "Setting up Zsh plugins..."

  if [[ ! -d "$HOME/.config/zsh/plugins/ohmyzsh/.git" ]]; then
    echo "Cloning Oh My Zsh..."
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh \
      "$HOME/.config/zsh/plugins/ohmyzsh"
  else
    echo "Oh My Zsh already installed"
  fi
}

################################
# Stow dotfiles
################################
stow_dotfiles() {
  echo "🐗 Stowing dotfiles"

  command -v stow >/dev/null || brew install stow

  stow --restow --no-folding -vt ~ zsh tmux starship git
}

################################
# Main
################################
main() {
  echo "🚀 Starting macOS bootstrap"

  create_dirs
  install_xcode_cli
  install_rosetta
  install_brew
  #apply_macos_defaults
  add_zsh_plugins
  stow_dotfiles

  echo "✨ Setup complete"
}

main

################################
# Restore sleep behavior
################################
kill "$CAFFEINATE_PID"
