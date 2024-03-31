{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Frappe";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 6;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      draw_minimal_borders = false;
    };
  };
}
