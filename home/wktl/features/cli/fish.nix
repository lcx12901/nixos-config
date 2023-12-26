{
  programs.fish = {
    enable = true;
    shellAbbrs = rec {
      n = "nix";
      nd = "nix develop -c $SHELL";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nfu = "nix flake update";
    };
  };
}