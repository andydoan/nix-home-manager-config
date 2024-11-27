{
  description = "Home Manager configuration";

  inputs = {
    # Use the nixos-24.05 channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      username = "andy";
    in {
      homeConfigurations = {
        "${username}@wsl" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ 
            ./common.nix
            ./hosts/home-wsl.nix
          ];
        };

        "${username}@ubuntu" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ 
            ./common.nix
            ./hosts/home-ubuntu.nix
          ];
        };

        "${username}@mac" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [ 
            ./common.nix
            ./hosts/home-darwin.nix
          ];
        };
      };
    };
}
