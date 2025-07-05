{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  package = pkgs.helix;
  defaultEditor = true;
  ignores = [
    "!.gitignore"
    ".DS_Store"
    ".git*"
    ".git/"
    "build/"
    "coverage/"
    "dist/"
    "node_modules/"
    "target/"
    "vendor/"
  ];
  languages = lib.importTOML ./languages.toml;
  settings = lib.importTOML ./config.toml;
  themes = lib.importTOML ./catppuccin_mocha.toml;
}
