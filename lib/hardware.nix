_: let
  isx86Linux = pkgs: with pkgs.stdenv; hostPlatform.Linux && hostPlatform.isx86;
in {
  inherit isx86Linux;
}
