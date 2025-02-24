{ pkgs, username, ... }: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # git
    git
    git-lfs
    delta
    lazygit

    nil
    nixfmt
    go-task
    # currently having an issue with its version of ghostty
    # ghostty 

    # nushell stuff
    nushell

    # zsh stuff
    oh-my-zsh
    zsh-powerlevel10k
    # terminal stuff
    neovim
    ripgrep
    fzf
    zoxide
    eza
    bat
    btop
    gh
    fastfetch
    starship
    carapace

    clang-tools
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  # homebrew = {
  #   enable = true;

  #   onActivation = {
  #     autoUpdate = false;
  #     # 'zap': uninstalls all formulae(and related files) not listed here.
  #     # cleanup = "zap";
  #   };

  #   taps = [ "homebrew/services" ];

  #   # `brew install`
  #   # TODO Feel free to add your favorite apps here.
  #   brews = [
  #     # "aria2"  # download tool
  #   ];

  #   # `brew install --cask`
  #   # TODO Feel free to add your favorite apps here.
  #   casks = [
  #     # "google-chrome"
  #   ];
  # };
}
