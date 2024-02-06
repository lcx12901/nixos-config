{
  pkgs,
  specialArgs,
  ...
}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons =
      (with pkgs; [
        fcitx5-chinese-addons
        #fcitx5-rime
        fcitx5-gtk # gtk im module
      ])
      ++ (with pkgs.nur.repos.ruixi-rebirth; [
        fcitx5-pinyin-moegirl
        fcitx5-pinyin-zhwiki
      ]);
  };

  home.file.".local/share/fcitx5/themes".source = "${pkgs.nur.repos.ryan4yin.catppuccin-fcitx5}/src";

  xdg.configFile = {
    "fcitx5/conf/classicui.conf".source = ./classicui.conf;
  };
}
