{
  config,
  pkgs,
  useremail,
  ...
}: {
  programs.git = {
    enable = true;

    userEmail = useremail;
    userName = "lcx12901";

    package = pkgs.gitAndTools.gitFull;

    extraConfig = {
      init.defaultBranch = "main";
      diff.tool = "nvimdiff";
      diff.guitool = "nvimdiff";
      merge.tool = "nvimdiff";
      merge.conflictstyle = "diff3";
      mergetool.keepBackup = false;
      mergetool.prompt = false;
      mergetool."vimdiff" = {
        layout = "LOCAL,MERGED,REMOTE";
      };
    };

    lfs.enable = true;
    ignores = [".direnv" "result" "dist" "node_modules"];
  };
}
