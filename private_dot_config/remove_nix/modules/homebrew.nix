{
  config,
  lib,
  pkgs,
  ...
}:
{
  homebrew = {
    enable = true;
    user = config.system.primaryUser;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    brews = [
      "chezmoi" # Chezmoi is a tool for managing dotfiles
    ];

    casks = [
      "affinity-designer"
      "bazecor" # Bazecor is the configuration tool for Dygma keyboards
      "claude" # This is the official desktop GUI app from Anthropic
      "dropbox"
      "dropzone" # Dropzone is a file management and automation tool for macOS
      "autodesk-fusion" # Autodesk Fusion 360 is a CAD/CAM software for product design
      "hammerspoon" # Hammerspoon is a tool for automating macOS with Lua scripts
      "jump-desktop" # Jump is a remote desktop client for macOS
      "legcord" # Legcord is a Discord client for macOS
      "messenger" # Messenger is a messaging app from Meta
      "microsoft-auto-update"
      "microsoft-office"
      "microsoft-teams"
      "orbstack" # Orbstack is a tool for managing Docker containers on macOS
      "orcaslicer" # OrcaSlicer is a slicer software for 3D printing
      "vivaldi" # Vivaldi is a Chrome-based web browser
      "zed@preview" # Zed is a Rust-based code editor with a focus on collaboration (preview version)

      #. GUI Apps not currently being used
      # "affinity-photo"
      # "affinity-publisher"
      # "bambu-studio" # Bambu Studio is a slicer software for 3D printing
      # "balenaetcher" # Balena Etcher is a tool for flashing OS images to SD cards and USB drives
      # "kap" # Kap is a screen recording app for macOS
      # "local" # Local is a GUI app for working with local WordPress sites
      # "prusaslicer" # PrusaSlicer is a slicer software for 3D printing
      # "yaak" # Yaak is an API client for testing and debugging APIs
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      "Dark Reader for Safari" = 1438243180;
      # "IP Scanner" = 6443819966; # Not currently using it
      # "LightBlue" = 557428110; # Not currently using it
      # "ServiceM8" = 1585087725; # Not currently using it
      # "Speedtest" = 1153157709; # Not currently using it
      "Xcode" = 497799835;
    };
  };
}
