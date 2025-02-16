{ pkgs, ... }:

{
  nix.settings = {
    # Necessary for using flakes on this system.
    # enable flakes globally
    experimental-features = [ "nix-command" "flakes" ];

  };

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  nix.enable = true;
  # nix.package = pkgs.nix;
}
