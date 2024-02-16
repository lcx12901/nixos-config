{
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    fish.enable = true;
  };

  xdg.configFile."direnv/direnv.toml".text = ''
    [whitelist]
    prefix = [ "/home/wktl/Coding" ]
  '';
}
