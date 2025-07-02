#!/bin/bash

# Check if Homebrew is already installed
if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is already installed"
  exit 0
fi

echo "Installing Homebrew..."

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH for Apple Silicon Macs
if [[ $(uname -m) == 'arm64' ]]; then
  BREW_EVAL='eval "$(/opt/homebrew/bin/brew shellenv)"'
  if ! grep -Fq "$BREW_EVAL" ~/.config/env/exports 2>/dev/null; then
    echo "$BREW_EVAL" >>~/.config/env/exports
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  BREW_EVAL='eval "$(/usr/local/bin/brew shellenv)"'
  if ! grep -Fq "$BREW_EVAL" ~/.config/env/exports 2>/dev/null; then
    echo "$BREW_EVAL" >>~/.config/env/exports
  fi
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Homebrew installation completed"
