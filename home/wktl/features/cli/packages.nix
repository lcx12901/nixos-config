{pkgs, ...}: {
  home.packages = with pkgs; [
    jq
    btop
    nest-cli
  ];
}
