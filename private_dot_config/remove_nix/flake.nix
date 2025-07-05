{
  description = "tpsTech macOS Workstation Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    workaround-poppler.url = "path:./modules/workaround-poppler";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      workaround-poppler,
      ...
    }:
    {
      darwinConfigurations.hugo = import ./hosts/tpstech.nix { inherit inputs; };
      darwinConfigurations.hijo-de-hugo = import ./hosts/tpstech.nix { inherit inputs; };
    };
}
