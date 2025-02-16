{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, ... }:
    let
      configuration = { pkgs, ... }: {

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#pedros-MacBook-Air
      darwinConfigurations."pedro" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./modules/apps.nix
          ./modules/system.nix
          ./modules/nix-core.nix
        ];
      };

      darwinPackages = self.darwinConfigurations."pedro".pkgs;
    };
}
