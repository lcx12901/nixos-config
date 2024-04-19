{pkgs, ...}: let
  shellAliases = {
    v = "nvim";
    vdiff = "nvim -d";
  };
in {
  imports = [
    ./packages.nix
  ];

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
