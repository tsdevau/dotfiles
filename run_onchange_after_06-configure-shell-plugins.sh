#!/bin/zsh

echo "Configuring shell environment..."

# Set zsh as default shell if not already set
if [[ "$SHELL" != "$(which zsh)" ]]; then
  echo "Setting zsh as default shell..."
  chsh -s "$(which zsh)"
fi

# Install zsh plugins
if [[ ! -d "${ZDOTDIR:-$HOME/.config/zsh}/plugins/fzf-tab" ]]; then
  echo "Installing fzf-tab..."
  git clone https://github.com/Aloxaf/fzf-tab.git "${ZDOTDIR:-$HOME/.config/zsh}/plugins/fzf-tab"
fi

if [[ ! -d "${ZDOTDIR:-$HOME/.config/zsh}/plugins/zsh-autosuggestions" ]]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZDOTDIR:-$HOME/.config/zsh}/plugins/zsh-autosuggestions"
fi

if [[ ! -d "${ZDOTDIR:-$HOME/.config/zsh}/plugins/code-stats-zsh" ]]; then
  echo "Installing code-stats-zsh..."
  git clone https://gitlab.com/code-stats/code-stats-zsh.git "${ZDOTDIR:-$HOME/.config/zsh}/plugins/code-stats-zsh"
fi

if [[ ! -d "${ZDOTDIR:-$HOME/.config/zsh}/plugins/zsh-history-substring-search" ]]; then
  echo "Installing zsh-history-substring-search..."
  git clone https://github.com/zsh-users/zsh-history-substring-search.git "${ZDOTDIR:-$HOME/.config/zsh}/plugins/zsh-history-substring-search"
fi

if [[ ! -d "${ZDOTDIR:-$HOME/.config/zsh}/plugins/zsh-syntax-highlighting" ]]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZDOTDIR:-$HOME/.config/zsh}/plugins/zsh-syntax-highlighting"
fi

echo "Shell configuration completed"
