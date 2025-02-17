{ pkgs, ... }: {

  home.packages = with pkgs; [
    # utils
    # jq # A lightweight and flexible command-line JSON processor
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    ngrok
    qbittorrent
    postman
    # imagemagick
    ocrmypdf
    sqlite
    pnpm
    rustup
    # misc
    tree

  ];

  programs = {
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}
