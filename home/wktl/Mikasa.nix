{ username, useremail, nix-index-database, pkgs, ... }: {
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
    wget
  ];

  programs = {
    home-manager.enable = true;
    nix-index.enable = true;
    nix-index.enableZshIntegration = true;
    nix-index-database.comma.enable = true;

    git = {
      enable = true;
      userEmail = useremail; # FIXME: set your git email
      userName = username; #FIXME: set your git username
    };
  };
  
}
