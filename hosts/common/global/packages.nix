{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    vim
  ];

  programs.vim.defaultEditor = true;
}