{
  config,
  lib,
  pkgs,
  ...
}:

{
  security.pam.services.sudo_local.touchIdAuth = true;
  security.pam.services.sudo_local.watchIdAuth = true;

  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
    inter
    montserrat
    roboto
  ];

  programs = {
    _1password = {
      enable = true;
      package = pkgs._1password-cli;
    };
    _1password-gui = {
      enable = true;
      package = pkgs._1password-gui;
    };
    zsh = {
      enableBashCompletion = true;
      enableCompletion = true;
    };
  };
}
