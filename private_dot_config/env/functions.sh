# Normalize `open` across Linux, macOS, and Windows.
if [[ ! $(uname -s) = "Darwin" ]]; then
  if grep -q Microsoft /proc/version; then
    # Ubuntu on Windows using the Linux subsystem
    alias open="explorer.exe"
  else
    alias open="xdg-open"
  fi
fi

# Recursively delete ".DS_Store" and ".dbxignore" files from the current directory.
rmdsdb() {
  if [[ $(uname -s) = "Darwin" ]]; then
    find . \( -name ".DS_Store" -o -name ".dbxignore" \) -type f -delete
  else
    echo "This function is only applicable on macOS."
  fi
}

# Empty all Trash on all macOS mounted volumes.
trashall() {
  if [[ $(uname -s) = "Darwin" ]]; then
    echo -e "\033[31m*** STOP! *** This function will permanently delete all files in the Trash on all mounted volumes and clear all Apple System Logs.\033[0m"
    read "confirm?Are you sure you want to proceed? (y/N): "

    if [[ "$confirm" =~ ^[yY]$ ]]; then

      for volume in /Volumes/*; do
        if [[ -d "$volume/.Trashes" ]]; then
          echo "Emptying Trash on $volume"
          sudo command rm -rf "$volume/.Trashes/*"
        else
          echo "No Trash found on $volume"
        fi
      done
      echo "All Trash emptied."

      echo "Clearing all Apple System Logs..."
      sudo command rm -rf /private/var/log/asl/*.asl
      echo "Apple System Logs cleared."

      # echo "Clearing download history from Quarantine..."
      # sqlite3 "${HOME}/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV*" 'delete from LSQuarantineEvent'
      # echo "Download history cleared from Quarantine."

    else
      echo "Operation aborted by user."
    fi

  else
    echo "This function is only applicable on macOS."
  fi
}
