#!/bin/bash

echo "Configuring macOS defaults..."

# @license
# tpsTech <https://tpstech.dev/>
# License: MIT
# Licence Copyright: TPS Contractors Pty Ltd and its affiliates.  All rights reserved.
#
# Copyright (c) 2020-2024 tpsTech, TPS Contractors Pty Ltd and its affiliates.  All rights reserved.
# @Author: @tsdevau

####################################################################################################
# Setup to Load System Preferences                                                                 #
####################################################################################################

# Close System Settings, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Settings" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
  sudo -n true
  sleep 120
  kill -0 "$$" || exit
done 2>/dev/null &

####################################################################################################
# System Language & Format Preferences                                                             #
####################################################################################################

# Set System Locale
defaults write NSGlobalDomain AppleLocale -string "en_AU"

# Set System Timezone
sudo systemsetup -settimezone "Australia/Brisbane" 2>/dev/null 1>&2

# Set System Language preferences
defaults write NSGlobalDomain AppleLanguages -array "en_AU" "en"
defaults write NSGlobalDomain NSLinguisticDataAssetsRequested -array "en_AU" "en"
defaults write NSGlobalDomain NSLinguisticDataAssetsRequestedByChecker -array "en_AU" "en"

# Set System time preference to 24 hour time
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# Set System date format
defaults write NSGlobalDomain AppleICUDateFormatStrings -dict 1 "dd/MM/yyyy" 2 "dd MMM yyyy" 3 "dd MMMM yyyy" 4 "EEEE, dd MMMM yyyy"

# Set System Measurement Units to Metric
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write NSGlobalDomain AppleMeasurementUnits -string "Millimeters"

####################################################################################################
# Text & Automatic Formatting Preferences                                                          #
####################################################################################################

# Set Cursor as the default text editor app
defaults write com.apple.LaunchServices/com.apple.LaunchServices.secure LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=dev.zed.Zed;}'

# Enable Spell Checking
defaults write NSGlobalDomain NSAllowContinuousSpellChecking -bool true

# Enable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true

# Enable automatic text completion
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool true

# Enable automatic capitalisation
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool true

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable automatic dash substitution
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic quote substitution
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Enable font smoothing
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false
defaults write -g AppleFontSmoothing -int 3

# User defined text snippets and symbol replacements
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array
# Replace (r) with the Registered Trademark symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(r)"; with = "\u00AE"; }'
# Replace (tm) with the Trademark symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(tm)"; with = "\u2122"; }'
# Replace (c) with the Copyright symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(c)"; with = "\u00A9"; }'
# Replace (deg) with the Degree symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(deg)"; with = "\u00B0"; }'
# Replace (pm) with the Plus-Minus symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(pm)"; with = "\u00B1"; }'
# Replace (b) with the Bullet symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(b)"; with = "\u2022"; }'
# Replace (em) with the Em Dash
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(em)"; with = "\u2014"; }'
# Replace (ell) with the Ellipsis
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(ell)"; with = "\u2026"; }'
# Replace (euro) with the Euro Currency symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(euro)"; with = "\u20AC"; }'
# Replace (pound) with the Pound Sterling symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(pound)"; with = "\u00A3"; }'
# Replace (yen) with the Yen Currency symbol
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on = 1; replace = "(yen)"; with = "\u00A5"; }'

####################################################################################################
# System UI Preferences                                                                            #
####################################################################################################

# Enable System Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Enable menubar to display in fullscreen mode
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -bool true

# Enable double click on window titlebar to maximise the window
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Maximize"

# Disable double click on window titlebar to minimize the window
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

# Enable option to always prefer tabs instead of windows
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# Enable click on wallpaper to show the desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool true

####################################################################################################
# Display Preferences                                                                              #
####################################################################################################

# Enable HiDPI display modes (requires restart)
defaults write com.apple.windowserver DisplayResolutionEnabled -bool true

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

####################################################################################################
# Screen Capture Preferences                                                                       #
####################################################################################################

# Set the default save location for screen captures
defaults write com.apple.screencapture location -string "${HOME}/CloudStorage/Dropbox/screenshots"

# Set the default file format for screen captures (options: PNG, BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screen captures
defaults write com.apple.screencapture disable-shadow -bool true

####################################################################################################
# File & Finder Preferences                                                                        #
####################################################################################################

# Show the ~/Library folder
chflags nohidden ~/Library
if xattr ~/Library | grep -q "com.apple.FinderInfo"; then
  xattr -d com.apple.FinderInfo ~/Library
fi

# Set Home folder as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# For other paths, use `PfLo` and `file:///full/path/here/`
# defaults write com.apple.finder NewWindowTarget -string "PfLo"
# defaults write com.apple.finder NewWindowTargetPath -string "file:///full/path/here/"

# Disable finder animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Don't show anything on the desktop
# defaults write com.apple.finder CreateDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Set default Finder view to list view
# List View
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Icon View
# defaults write com.apple.finder FXPreferredViewStyle -string "icnv"
# Column View
# defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# Cover Flow View
# defaults write com.apple.finder FXPreferredViewStyle -string "Flwv"

# Set detailed list view for open dialog
defaults write NSGlobalDomain NSNavPanelFileListModeForOpenMode -int 2
defaults write NSGlobalDomain NSNavPanelFileListModeForOpenMode2 -int 2

# Set detailed list view for save dialog (assuming a similar key exists)
defaults write NSGlobalDomain NSNavPanelFileListModeForSaveMode -int 2
defaults write NSGlobalDomain NSNavPanelFileListModeForSaveMode2 -int 2

# Ensure open dialog opens in expanded mode by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForOpenMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForOpenMode2 -bool true

# Ensure save dialog opens in expanded mode by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Prefer save to disk over save to iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Ensure print dialog opens in expanded mode by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically close the print dialog after printing completes
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable .DS_Store files on USB drives & network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Enable the Finder Quit menu item
defaults write com.apple.finder QuitMenuItem -bool true

# Enable the Finder Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Enable the Finder Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# Enable the Finder titlebar to display the full path
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

# Set default Finder search scope to current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

####################################################################################################
# Mouse & Trackpad Preferences                                                                     #
####################################################################################################

# Enable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Enable tap to click
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable force touch
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true

# Enable two finger tap to right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Enable three finger tap to show look up
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2

# Enable three finger swipe between pages
defaults write -g com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
defaults -currentHost write -g com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults -currentHost write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

####################################################################################################
# Keyboard Preferences                                                                             #
####################################################################################################

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialog)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favour of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

####################################################################################################
# Bluetooth Preferences                                                                            #
####################################################################################################

# Enable Bluetooth

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

####################################################################################################
# Dock Preferences                                                                                 #
####################################################################################################

# Only show open applications in the Dock
defaults write com.apple.dock static-only -bool true

# Disable rearranging spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Disable window grouping in Mission Control
# (i.e. group windows by application)
defaults write com.apple.dock expose-group-by-app -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Show hidden applications in Mission Control
# defaults write com.apple.dock showhidden -bool true
# defaults write com.apple.dock mru-spaces -bool false

# Enable the Dock to automatically hide and show
defaults write com.apple.dock autohide -bool true

# Set the Dock to hide immediately
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Enable the Dock to hide in fullscreen mode
# This setting is not available in macOS Ventura and later, as fullscreen mode now automatically hides
# defaults write com.apple.dock autohide-fullscreen -bool true

# Disable launchpad gesture
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Set icon size for the Dock items to minimum
defaults write com.apple.dock tilesize -int 16

# Set the magnification size for the Dock items
defaults write com.apple.dock largesize -int 64

# Disable recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Set the position of the Dock to the bottom
defaults write com.apple.dock orientation -string "bottom"

# Set Hot Corners
# Top Right: Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
# Bottom Left: Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
# Available options:
# 0: no-op
# 2: Mission Control
# 3: Show application windows
# 4: Desktop
# 5: Start screen saver
# 6: Disable screen saver
# 7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen

####################################################################################################
# Activity Monitor                                                                                 #
####################################################################################################

# Show the main window when launching Activity Monitor
defaults write -app "Activity Monitor" OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write -app "Activity Monitor" IconType -int 5

# Show all processes in Activity Monitor
defaults write -app "Activity Monitor" ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write -app "Activity Monitor" SortColumn -string "CPUUsage"
defaults write -app "Activity Monitor" SortDirection -int 0

####################################################################################################
# Time Machine Preferences                                                                         #
####################################################################################################

# Disable Time Machine prompt to use connected drives as a Time Machine volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &>/dev/null && sudo tmutil disable

####################################################################################################
# Mac App Store                                                                                    #
####################################################################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
# defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
# defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

####################################################################################################
# Application Specific Preferences                                                                 #
####################################################################################################

# Change the default directory for Hammerspoon to use XDG_CONFIG_HOME
defaults write org.hammerspoon.Hammerspoon MJConfigFile "${XDG_CONFIG_HOME:-$HOME/.config}/hammerspoon/init.lua"

echo "macOS defaults configuration completed."
