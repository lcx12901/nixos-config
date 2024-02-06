{pkgs, ...}: {
  imports = [(import ./theme.nix)];
  home.packages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
  ];
}
