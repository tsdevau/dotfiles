{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true; # Testing nixpkgs Binary install for Darwin as source build is broken
  enableBashIntegration = true; # Testing nixpkgs Binary install for Darwin as source build is broken
  enableZshIntegration = true; # Testing nixpkgs Binary install for Darwin as source build is broken
  package = pkgs.ghostty-bin;
  installBatSyntax = true;
  installVimSyntax = true;
  settings = {
    background-opacity = 0.9;
    theme = "catppuccin-mocha";
    unfocused-split-opacity = 0.6;

    font-family = "MesloLGM Nerd Font Mono Regular";
    font-family-bold = "MesloLGM Nerd Font Mono Bold";
    font-family-bold-italic = "MesloLGM Nerd Font Mono Bold Italic";
    font-family-italic = "MesloLGM Nerd Font Mono Italic";
    font-size = 16;

    adjust-cursor-thickness = 4;
    cursor-style = "bar";
    cursor-style-blink = true;
    window-decoration = "auto";
    window-padding-balance = true;
    window-padding-y = 4;
    window-theme = "dark";

    confirm-close-surface = false;
    link-url = true;
    scrollback-limit = 104857600;
    shell-integration = "detect";
    shell-integration-features = "no-cursor";
    term = "xterm-256color";
    window-save-state = "always";

    macos-option-as-alt = true;
    macos-secure-input-indication = true;
    macos-titlebar-style = "hidden";

    keybind = [
      "super+k=unbind"
      "alt+delete=text:\x1b\x64"
      "super+backspace=text:\x1b\x5b\x31\x3b\x08"
      "super+delete=text:\x0b"
      "super+shift+k=text:\x15"
      "page_down=scroll_page_down"
      "page_up=scroll_page_up"
      "super+page_down=unbind"
      "super+page_up=unbind"
      "cmd+shift+down=adjust_selection:end"
      "cmd+shift+up=adjust_selection:home"
      "shift+end=adjust_selection:end_of_line"
      "shift+home=adjust_selection:beginning_of_line"
      "cmd+alt+physical:one=goto_split:left"
      "cmd+alt+physical:two=goto_split:right"
      "super+alt+down=resize_split:down,10"
      "super+alt+enter=toggle_split_zoom"
      "super+alt+equal=equalize_splits"
      "super+alt+left=resize_split:left,10"
      "super+alt+right=resize_split:right,10"
      "super+alt+up=resize_split:up,10"
      "super+ctrl+down=unbind"
      "super+ctrl+equal=unbind"
      "super+ctrl+left=unbind"
      "super+ctrl+right=unbind"
      "super+ctrl+up=unbind"
      "super+shift+enter=unbind"
      "super+enter=unbind"
      "ctrl+tab=text:\x1b\x5b\x32\x37\x3b\x35\x3b\x39\x7e"
      "ctrl+shift+tab=text:\x1b\x5b\x32\x37\x3b\x36\x3b\x39\x7e"
    ];
  };
  themes = {
    "catppuccin-mocha" = {
      palette = [
        "0=#45475a"
        "1=#f38ba8"
        "2=#a6e3a1"
        "3=#f9e2af"
        "4=#89b4fa"
        "5=#f5c2e7"
        "6=#94e2d5"
        "7=#bac2de"
        "8=#585b70"
        "9=#f38ba8"
        "10=#a6e3a1"
        "11=#f9e2af"
        "12=#89b4fa"
        "13=#f5c2e7"
        "14=#94e2d5"
        "15=#a6adc8"
      ];
      background = "1e1e2e";
      foreground = "cdd6f4";
      cursor-color = "f5e0dc";
      cursor-text = "1e1e2e";
      selection-background = "353749";
      selection-foreground = "cdd6f4";
    };
  };
}
