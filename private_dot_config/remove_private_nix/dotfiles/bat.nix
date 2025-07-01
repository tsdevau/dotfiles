{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  package = pkgs.bat;
  config = {
    color = "always";
    style = "numbers,changes,header";
    tabs = "2";
    theme = "Catppuccin Mocha";
  };
  themes = {
    "Catppuccin Mocha" = {
      file = "themes/Catppuccin Mocha.tmTheme";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "699f60fc8ec434574ca7451b444b880430319941";
        sha256 = "sha256-6fWoCH90IGumAMc4buLRWL0N61op+AuMNN9CAR9/OdI=";
      };
    };
  };
}
