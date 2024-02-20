{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs_20
    nodePackages.pnpm
  ];

  xdg.configFile."pnpm/rc".text = ''
    cache-dir=/home/wktl/Coding/.pnpm-store/cache
    global-bin-dir=/home/wktl/Coding/.pnpm-store
    state-dir=/home/wktl/Coding/.pnpm-store/state
    global-dir=/home/wktl/Coding/.pnpm-store/global
  '';
}
