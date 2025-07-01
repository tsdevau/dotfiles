{ inputs, ... }:

inputs.nix-darwin.lib.darwinSystem {
  modules = [
    inputs.home-manager.darwinModules.home-manager
    ../modules/darwin.nix
    ../modules/homebrew.nix
    ../modules/environment.nix
    ../modules/home-manager.nix
    {
      nix = {
        gc = {
          automatic = true;
          interval = [
            {
              Day = 6;
              Hour = 2;
              Minute = 1;
            }
          ];
        };
        optimise = {
          automatic = true;
          interval = [
            {
              Day = 6;
              Hour = 2;
              Minute = 31;
            }
          ];
        };
        settings = {
          experimental-features = "nix-command flakes";
        };
      };

      nixpkgs = {
        buildPlatform = {
          system = "aarch64-darwin";
        };
        config = {
          allowUnfree = true;
          allowVariants = false;
          checkMeta = true; # Remove this if any issue arises
          warnUndeclaredOptions = true;
        };
        hostPlatform = {
          system = "aarch64-darwin";
        };
        overlays = [
          inputs.workaround-poppler.overlays.popplerFix
        ];
      };

      system = {
        configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
        defaults = import ../modules/darwin-system-defaults.nix { inherit inputs; };

        primaryUser = "tpstech";
        stateVersion = 6;
      };

      users.users.tpstech = {
        name = "tpstech";
        home = "/Users/tpstech";
        description = "Tim Stone (@tsdevau)";
      };
    }
  ];
}
