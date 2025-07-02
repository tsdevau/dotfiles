#!/bin/bash

echo "Configuring Touch ID and Watch ID for sudo..."

# Run the installation script for pam_watchid.so from my GitHub repository
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/tsdevau/pam_watchid/HEAD/install.sh)"

echo "Touch ID and Watch ID configuration for sudo completed."

# Reload sudo session
echo "Reloading sudo configuration..."
sudo -k
echo "Sudo configuration reloaded. You can now use Touch ID and Watch ID for sudo commands."
