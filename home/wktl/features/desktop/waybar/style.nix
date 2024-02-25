{
  config,
  nix-colors,
  ...
}: {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.catppuccin-frappe;

  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 20px;
      font-family: JetBrainsMono Nerd Font;
      font-weight: bold;
      font-size: 15px;
      min-height: 0;
      opacity: 0.98;
    }

    window#waybar {
      background: none;
    }

    #custom-launcher {
      color: #89b4fa;
      background: #${config.colorScheme.palette.base01};
      border-radius: 0px 0px 40px 0px;
      margin: 0px;
      padding: 0px 30px 0px 10px;
      font-size: 28px;
    }

    #workspaces {
        background: #${config.colorScheme.palette.base01};
        margin: 5px 5px;
        padding: 8px 12px;
    }

    #workspaces button {
      background-color: #${config.colorScheme.palette.base0D};
      color: #${config.colorScheme.palette.base01};
      border-radius: 15px;
      min-width: 20px;
      padding: 0 5px;
      margin: 0 3px;
      transition: all 0.2s ease-in-out;
    }

    #workspaces button.active {
      background-color: #${config.colorScheme.palette.base0E};
      min-width: 35px;
      transition: all 0.2s ease-in-out;
    }

    #workspaces button:hover {
      background-color: #${config.colorScheme.palette.base07};
      min-width: 35px;
      transition: all 0.2s ease-in-out;
    }

    #tray,
    #pulseaudio,
    #network,
    #cpu,
    #memory,
    #disk,
    #temperature,
    #custom-playerlabel,
    #cava.left,
    #cava.right,
    #clock {
      background: #${config.colorScheme.palette.base01};
      margin: 5px 0px 12px 5px;
      padding: 0 15px;
    }

    #temperature {
      color: #${config.colorScheme.palette.base0C};
    }

    #custom-playerlabel {
      color: #${config.colorScheme.palette.base0E};
    }

    #cpu {
      color: #${config.colorScheme.palette.base06};
    }

    #memory {
      color: #${config.colorScheme.palette.base09};
    }

    #disk {
      color: #${config.colorScheme.palette.base05};
    }

    #tray {
      color: #${config.colorScheme.palette.base0A};
    }

    #pulseaudio {
      color: #${config.colorScheme.palette.base0C};
    }

    #network {
      color: #${config.colorScheme.palette.base0B};
    }

    #clock {
      color: #${config.colorScheme.palette.base0F};
      margin-right: 12px;
    }

    #cava.left, #cava.right {
      color: #${config.colorScheme.palette.base0F};
    }
  '';
}
