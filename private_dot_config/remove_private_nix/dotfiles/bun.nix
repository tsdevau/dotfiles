{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  enableGitIntegration = true;
  package = pkgs.bun;
  settings = {
    telemetry = false;
    install = {
      auto = "auto";
      cache = {
        dir = "$XDG_CONFIG_HOME/bun/.cache";
      };
      globalDir = "$XDG_CONFIG_HOME/bun";
      globalBinDir = "$XDG_CONFIG_HOME/bun/bin";
      saveTextLockfile = true;
    };
  };
}
