{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    vim
    alejandra
  ];

  programs.vim.defaultEditor = true;
}
