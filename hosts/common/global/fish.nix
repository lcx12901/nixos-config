{pkgs, ...}: {
  programs.fish = {
    enable = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # fish plugins
    fishPlugins.z
    fishPlugins.grc
    grc
    fishPlugins.autopair
  ];
}
