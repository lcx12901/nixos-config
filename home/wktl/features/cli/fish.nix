{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set fish_user_paths /home/wktl/Coding/.pnpm-store
    '';
    shellAbbrs = {
      n = "nix";
      nd = "nix develop -c $SHELL";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nfu = "nix flake update";
    };
    shellAliases = {
      nvimdiff = "nvim -d";
    };
  };
}
