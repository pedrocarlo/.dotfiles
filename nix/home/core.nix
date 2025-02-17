{ pkgs, zshPath, ... }: {
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

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
        highlight = "fg=#939393,bold,underline";
      };
      dotDir = ".dotfiles/zsh";
      # promptInit =
      #   "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      shellAliases = {
        ls =
          "eza --color=auto --git --no-filesize --icons=always --no-time --no-user --no-permissions --grid --show-symlinks --follow-symlinks";
      };

      plugins = [
        {
          name = "powerlevel10k-config";
          src = zshPath;
          file = ".p10k.zsh";
        }
        {
          name = "zsh-powerlevel10k";
          src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
          file = "powerlevel10k.zsh-theme";
        }
      ];

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

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "zoxide" ];
        extraConfig = ''
          export ZOXIDE_CMD_OVERRIDE=cd
        '';
      };
    };

    git = {
      enable = true;
      signing.format = "ssh";
      delta = { enable = true; };
      extraConfig = {
        init.defaultBranch = "main";
        user = {
          name = "pedrocarlo";
          email = "pedro.muniz.carlo@gmail.com";
        };
        filter = {
          "lfs" = {
            clean = "git-lfs clean -- %f";
            smudge = "git-lfs smudge -- %f";
            process = "git-lfs filter-process";
            required = true;
          };
        };
        core = { editor = "nvim"; };

        delta = {
          navigate = true;
          dark = true;
          line-numbers = true;
          side-by-side = true;
        };
        merge = { conflictstyle = "zdiff3"; };
      };
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
