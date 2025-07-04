#!/bin/zsh

# Get the filepath from the argument
filepath="$1"

if [ -d "$filepath" ]; then
  cwd_path=$(realpath "$filepath")
else
  exit 0
fi

# Run LazyGit with the directory path
wezterm cli spawn --cwd "$cwd_path" -- lazygit --path "$filepath"
