{ pkgs, username, ... }:

{
  nix.settings = {
    # Necessary for using flakes on this system.
    # enable flakes globally
    experimental-features = [ "nix-command" "flakes" ];

  };

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  nix.enable = true;
  nixpkgs.config.allowUnfree = true;
  # nix.package = pkgs.nix;

  programs.zsh = {
    enable = true;
    interactiveShellInit = "nu";
  };

  users.users.${username}.shell = pkgs.nushell;
  environment = { shellInit = "nu"; };
}
