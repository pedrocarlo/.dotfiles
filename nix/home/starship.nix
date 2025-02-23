{ pkgs, starshipPath, config, ... }: {

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    settings = pkgs.lib.importTOML ../../.config/starship.toml;
  };

  # home.file.".config/starship.toml" = {
  #   enable = true;
  #   source = config.lib.file.mkOutOfStoreSymlink starshipPath;
  # };
  # config.lib.file.mkOutOfStoreSymlink /home/jake/.config/alacritty;
}
