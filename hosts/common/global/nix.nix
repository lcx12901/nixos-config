{ pkgs, ... }: {
  nix = {
    settings = {
      trusted-users = ["root" "@wheel"];
      accept-flake-config = true;
      auto-optimise-store = true;
      warn-dirty = false;
    };
    package = pkgs.nixFlakes;
    extraOptions = ''experimental-features = nix-command flakes'';
    gc = {
      automatic = true;
      dates = "weekly";
      # Keep the last 3 generations
      options = "--delete-older-than +3";
    };
  };
}