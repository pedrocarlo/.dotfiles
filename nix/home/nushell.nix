{ pkgs, ... }: {

  home.shell.enableNushellIntegration = true;

  carapace.enable = true;
  carapace.enableNushellIntegration = true;

  programs.nushell = {
    enable = true;
    configFile.source = ../../nu/config.nu;

    shellAliases = {
      ls =
        "eza --color=auto --git --no-filesize --icons=always --no-time --no-user --no-permissions --grid --show-symlinks --follow-symlinks";

      #-------------Bat related------------
      cat = "bat";
      diff = "batdiff";
      rg = "batgrep";
      man = "batman";

      vi = "nvim";
      vim = "nvim";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#939393,bold,underline";
    };
    dotDir = ".dotfiles/zsh";
    shellAliases = {
      ls =
        "eza --color=auto --git --no-filesize --icons=always --no-time --no-user --no-permissions --grid --show-symlinks --follow-symlinks";

      #-------------Bat related------------
      cat = "bat";
      diff = "batdiff";
      rg = "batgrep";
      man = "batman";

      vi = "nvim";
      vim = "nvim";
    };

    initExtraFirst = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';

    initExtra = ''
      export PATH="$HOME/.local/bin:$PATH"
    '';

  };
}
