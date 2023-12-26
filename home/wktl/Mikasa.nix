{ username, useremail, nix-index-database, pkgs, ... }: {
  imports = [
    nix-index-database.hmModules.nix-index
    ./global
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.05";
  };

  home.packages = with pkgs; [
    neofetch
  ];

  home.file = {
    ".vscode-server-insiders/server-env-setup".source = ./server-env-setup;
  };

  programs = {
    home-manager.enable = true;
    nix-index.enable = true;
    nix-index.enableZshIntegration = true;
    nix-index-database.comma.enable = true;
  };
  
}
