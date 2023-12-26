{ pkgs, useremail, ...}: {
  programs.git = {
    enable = true;

    userEmail = useremail;
    userName = "lcx12901";

    package = pkgs.gitAndTools.gitFull;

    extraConfig = {
      init.defaultBranch = "main";
    };

    lfs.enable = true;
    ignores = [ ".direnv" "result" "dist" "node_modules" ];
  };
}