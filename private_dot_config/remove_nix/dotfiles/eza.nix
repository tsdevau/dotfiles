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
  package = pkgs.eza;
  colors = "always";
  extraOptions = [
    "--group-directories-first"
    "--header"
  ];
  git = true;
  icons = "always";
}
