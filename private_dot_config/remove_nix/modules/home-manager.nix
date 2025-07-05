{
  config,
  lib,
  pkgs,
  ...
}:
let
  userName = "tpstech";
  userHome = "/Users/${userName}";
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "before-nix-hm";
    users."${userName}" = {
      home = {
        file = {
          ".config/zsh/plugins/code-stats-zsh" = {
            source = pkgs.fetchzip {
              url = "https://gitlab.com/code-stats/code-stats-zsh/-/archive/master/code-stats-zsh-master.tar.gz";
              sha256 = "sha256-W1dEH2Nb/EbFgtFedvDpddEkaM+rpwA1Da1klCQ7CkM=";
              stripRoot = true;
            };
          };
          ".config/zed/settings.json" = {
            source = ../dotfiles/zed-editor/settings.json;
          };
          ".config/zed/keymap.json" = {
            source = ../dotfiles/zed-editor/keymap.json;
          };
          ".config/zed/extensions.json" = {
            source = ../dotfiles/zed-editor/extensions.json;
          };
        };
        homeDirectory = lib.mkDefault userHome;
        stateVersion = "25.11";
        username = userName;
      };

      programs = {
        # Darwin ONLY applications
        aerospace = import ../dotfiles/aerospace.nix { inherit config lib pkgs; };
        ghostty = import ../dotfiles/ghostty.nix { inherit config lib pkgs; };
        vscode = import ../dotfiles/vscode.nix { inherit config lib pkgs; };
        wezterm = import ../dotfiles/wezterm/wezterm.nix { inherit config lib pkgs; };
        zed-editor = import ../dotfiles/zed-editor/zed-editor.nix { inherit config lib pkgs; };

        # Common applications
        home-manager = {
          enable = true;
        };
        bat = import ../dotfiles/bat.nix { inherit config lib pkgs; };
        bun = import ../dotfiles/bun.nix { inherit config lib pkgs; };
        carapace = import ../dotfiles/carapace.nix { inherit config lib pkgs; };
        eza = import ../dotfiles/eza.nix { inherit config lib pkgs; };
        fastfetch = import ../dotfiles/fastfetch.nix { inherit config lib pkgs; };
        fd = import ../dotfiles/fd.nix { inherit config lib pkgs; };
        fzf = import ../dotfiles/fzf.nix { inherit config lib pkgs; };
        git = import ../dotfiles/git.nix { inherit config lib pkgs; };
        go = import ../dotfiles/go.nix { inherit config lib pkgs; };
        helix = import ../dotfiles/helix/helix.nix { inherit config lib pkgs; };
        starship = import ../dotfiles/starship.nix { inherit config lib pkgs; };
        zoxide = import ../dotfiles/zoxide.nix { inherit config lib pkgs; };
        zsh = import ./shell-zsh.nix { inherit config lib pkgs; };
      };

      services = {
        # Darwin ONLY services
        jankyborders = import ../dotfiles/borders.nix { inherit config lib pkgs; };
        ollama = import ../dotfiles/ollama.nix { inherit config lib pkgs; };
      };

      xdg = {
        enable = true;
        configHome = "${userHome}/.config";
        cacheHome = "${userHome}/.local/cache";
        dataHome = "${userHome}/.local/share";
        stateHome = "${userHome}/.local/state";
        configFile = {
          "fastfetch/tsdev_logo_square_256x256.png" = {
            source = ../assets/tsdev_logo_square_256x256.png;
          };
        };
      };
    };
  };
}
