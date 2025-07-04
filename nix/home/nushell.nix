{ pkgs, nushellPath, ... }: {

  home.shell.enableNushellIntegration = true;

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.fd = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
    # configFile.source = nushellPath;

    shellAliases = {
      ls =
        "eza --color=auto --git --no-filesize --icons=always --no-time --no-user --no-permissions --grid";

      #-------------Bat related------------
      cat = "bat";
      diff = "batdiff";
      rg = "batgrep";
      man = "batman";

      vi = "nvim";
      vim = "nvim";

      cd = "z";

      nix-rebuild = "sudo darwin-rebuild switch --flake ~/.dotfiles#pedro";

      find = "fd";
    };

    extraConfig = "source ~/.config/config.nu";
  };
}
