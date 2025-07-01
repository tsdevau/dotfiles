{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  package = pkgs.fd;
  extraOptions = [ ];
  hidden = true;
  ignores = [
    ".astro/"
    ".git/"
    "bower_components/"
    "build/"
    "coverage/"
    "dist/"
    "node_modules/"
    "vendor/"
  ];
}
