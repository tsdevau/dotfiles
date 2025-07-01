{
  config,
  lib,
  pkgs,
  ...
}:

{
  enable = true;
  enableBashIntegration = true;
  enableFishIntegration = false;
  enableZshIntegration = true;
  package = pkgs.zoxide;
  options = [ ];
}
