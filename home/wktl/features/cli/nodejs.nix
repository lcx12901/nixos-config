{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs_20
    nodePackages.pnpm
  ];

  xdg.configFile."pnpm/rc".text = ''
    cache-dir=~/Coding/.pnpm-store/cache
    global-bin-dir=~/Coding/.pnpm-store
    state-dir=~/Coding/.pnpm-store/state
    global-dir=~/Coding/.pnpm-store/global
  '';
}
