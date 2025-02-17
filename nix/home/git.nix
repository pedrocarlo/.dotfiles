{ ... }: {
  programs.git = {
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
}
