{
  description = "My nixos config";
  inputs = {
    # Latest stable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # Unstable
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    { self
    , nixpkgs
    , unstable
    , home-manager
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        elitebook = nixpkgs.lib.nixosSystem
          {
            specialArgs = { inherit inputs outputs; };
            modules = [ ./nixos/configuration.nix ];
          };
      };
      homeConfigurations = {
        "zoe@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ /home/zoe/.dotfiles/home-manager/home.nix ];
        };
      };
    };
}
