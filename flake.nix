{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url =
      "github:NixOS/nixpkgs/0d534853a55b5d02a4ababa1d71921ce8f0aee4c";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      username = "pedro";
      hostname = "pedro";
      zshPath = builtins.path {
        path = ./zsh;
        name = "zsh";
      };
      nushellPath = builtins.path {
        path = ./.config/config.nu;
        name = "config.nu";
      };
      configuration = { pkgs, ... }: {
        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
      specialArgs = { inherit username hostname zshPath nushellPath; };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#pedros-MacBook-Air
      darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
        inherit specialArgs;
        modules = [
          configuration
          ./nix/modules/apps.nix
          ./nix/modules/system.nix
          ./nix/modules/nix-core.nix
          ./nix/modules/fonts.nix

          # home manager
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
            users.users.${username} = { home = "/Users/${username}"; };
            home-manager.users.${username} = import ./nix/home;
          }
        ];
      };

      darwinPackages = self.darwinConfigurations.${username}.pkgs;
    };
}
