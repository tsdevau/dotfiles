#!/bin/bash

# Get the filepath from the argument
filepath="$1"

if [ -d "$filepath" ]; then
 cwd_path=$(realpath "$filepath")
 else
 cwd_path=$(realpath "$(dirname "$filepath")")
 fi

# Get the editor, default to vi if EDITOR is not set
editor="${EDITOR:-vi}"

# Run the editor with the file
wezterm cli spawn --cwd "$cwd_path" -- "$editor" "$filepath"

