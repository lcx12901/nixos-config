{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    # neovim-nightly
    alejandra
  ];

  # replace default editor with neovim
  environment.variables.EDITOR = "nvim";
}
