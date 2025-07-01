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
  package = pkgs.carapace;
}
