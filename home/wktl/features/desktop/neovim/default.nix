{
  pkgs,
  astronvim,
  neovim-nightly,
  ...
}: let
  shellAliases = {
    v = "nvim";
    vdiff = "nvim -d";
  };
in {
  imports = [
    ./packages.nix
  ];

  xdg.configFile = {
    "nvim" = {
      source = astronvim;
      force = true;
    };
    "astronvim/lua/user" = {
      source = ./user_config;
      force = true;
    };
  };

  home.shellAliases = shellAliases;
  programs.fish.shellAliases = shellAliases;

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      package = pkgs.neovim-nightly;

      plugins = with pkgs.vimPlugins; [
        # search all the plugins using https://search.nixos.org/packages
        telescope-fzf-native-nvim
      ];
    };
  };
}
