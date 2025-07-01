{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  package = pkgs.go;
  packages = { };
  extraGoPaths = [ ];
  goBin = ".go/bin";
  goPath = ".go";
  goPrivate = [ ];
}
