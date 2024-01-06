{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    vim
    v2ray-geoip
    v2ray-domain-list-community
  ];

  programs.vim.defaultEditor = true;
}