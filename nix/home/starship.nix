{ pkgs, rootPath, ... }: {
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    settings = pkgs.lib.importTOML rootPath + /.config/starship/starship.toml;
  };
}
