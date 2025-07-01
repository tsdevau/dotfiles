{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  enableBashIntegration = true;
  enableZshIntegration = true;
  package = pkgs.wezterm;
  extraConfig = builtins.readFile ./wezterm.lua;
}
