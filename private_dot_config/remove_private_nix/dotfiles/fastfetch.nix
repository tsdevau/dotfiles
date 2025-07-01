{
  config,
  lib,
  pkgs,
  ...
}:
{
  enable = true;
  package = pkgs.fastfetch;
  settings = {
    logo = {
      source = ../assets/tsdev_logo_square_144x144.png;
      type = "kitty-direct";
      padding = {
        left = 1;
        right = 1;
      };
    };
    display = {
      color = {
        keys = "yellow";
      };
      key = {
        type = "both";
      };
    };
    modules = [
      {
        type = "title";
        fqdn = true;
      }
      "os"
      "memory"
      "disk"
      {
        type = "datetime";
        key = "Date";
        format = "{9}, {23} {6} {1} {14}:{18}:{20}";
      }
      "uptime"
    ];
  };
}
