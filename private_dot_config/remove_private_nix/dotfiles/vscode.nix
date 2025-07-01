{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  package = pkgs.vscode;
  mutableExtensionsDir = true;
}
