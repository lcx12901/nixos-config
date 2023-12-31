{ username, pkgs, nix-index-database, ... }: {
  imports = [
    nix-index-database.hmModules.nix-index
    ./global
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    stateVersion = "23.11";
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