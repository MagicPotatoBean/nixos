{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "https://github.com/nix-community/nixvim/archive/main.tar.gz";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    overlays = [(import ./unfree.nix)];
    pkgs = import nixpkgs {
      inherit system;
      overlays = overlays;
    };
  in {
    nixosConfigurations.elitebook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./configuration.nix
        ({pkgs, ...}: {
          nixpkgs.overlays = [inputs.fenix.overlays.default];
          environment.systemPackages = with pkgs; [
            (fenix.complete.withComponents [
              "cargo"
              "clippy"
              "rust-src"
              "rustc"
              "rustfmt"
            ])
            rust-analyzer-nightly
          ];
        })
      ];
    };
  };
}
