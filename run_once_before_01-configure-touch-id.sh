#!/bin/zsh

# Add pam_tid.so and pam_watchid.so to the PAM sudo_local configuration
echo "Configuring Touch ID for sudo..."
sudo sed -i '' 's/^#\?\(auth\s\+sufficient\s\pam_tid.so\)/auth sufficient pam_tid.so/' /etc/pam.d/sudo_local
sudo sed -i '' 's/^#\?\(auth\s\+sufficient\s\pam_watchid.so\)/auth sufficient pam_watchid.so/' /etc/pam.d/sudo_local
echo "Touch ID configuration for sudo completed."

# Ensure the changes take effect immediately
echo "Reloading sudo configuration..."
sudo -k
echo "Sudo configuration reloaded. You can now use Touch ID for sudo commands."
