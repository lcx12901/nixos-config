{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;
    # languagePacks = ["zh-CN"];
  };
}
