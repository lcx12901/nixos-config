{pkgs, ...}: {
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package =
        pkgs.catppuccin-kvantum.override
        {
          accent = "Lavender";
          variant = "Mocha";
        };
      name = "Catppuccin-Mocha-Lavender";
    };
  };

  xdg.configFile = {
    "Kvantum/Catppuccin-Mocha-Lavender/Catppuccin-Mocha-Lavender/Catppuccin-Mocha-Lavender.kvconfig".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Mocha-Lavender/Catppuccin-Mocha-Lavender.kvconfig";
    "Kvantum/Catppuccin-Mocha-Lavender/Catppuccin-Mocha-Lavender/Catppuccin-Mocha-Lavender.svg".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Mocha-Lavender/Catppuccin-Mocha-Lavender.svg";
  };
}
