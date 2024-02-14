{
  imports = [
    ../home/wktl/features/cli
  ];

  home = {
    username = "wktl";
    homeDirectory = "/home/wktl";

    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;
  };
}
