{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      # utils
      # jq # A lightweight and flexible command-line JSON processor
      # aria2 # A lightweight multi-protocol & multi-source command-line download utility

      # # misc
      tree
      # gnused
      # gnutar
      # gawk
      # gnupg

    ];

  programs = {
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    # eza = {
    #   enable = true;
    #   git = true;
    #   icons = true;
    #   enableZshIntegration = true;
    # };
  };
}
