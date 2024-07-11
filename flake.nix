{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim.url = "https://github.com/nix-community/nixvim/archive/main.tar.gz";
    fenix.url = "https://github.com/nix-community/fenix/archive/main.tar.gz";
  };

  outputs = {self, ...} @ inputs: {
    nixosConfigurations.elitebook = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
