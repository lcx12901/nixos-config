{ pkgs, agenix, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    vim
    agenix.packages.${pkgs.system}.default
  ];

  programs.vim.defaultEditor = true;
}