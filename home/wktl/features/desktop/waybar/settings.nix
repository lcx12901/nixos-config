{
  custom ? {
    font = "JetBrainsMono Nerd Font";
    fontsize = "12";
    primary_accent = "cba6f7";
    secondary_accent = "89b4fa";
    tertiary_accent = "f5f5f5";
    background = "11111B";
    opacity = ".85";
    # cursor = "Numix-Cursor";
  },
  ...
}: {
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/launcher"
      # "custom/playerctl#backward"
      # "custom/playerctl#play"
      # "custom/playerctl#foward"
      "temperature"
      "custom/playerlabel"
      # "hyprland/window"
    ];
    modules-center = [
      "hyprland/workspaces"
    ];
    modules-right = [
      "tray"
      "cpu"
      "memory"
      "disk"
      "pulseaudio"
      "network"
      "clock"
    ];

    clock = {
      interval = 1;
      format = " {:%B %d  %H:%M:%S}";
      format-alt = " {:%H:%M}";
      tooltip = "true";
      tooltip-format = "\n<span size='14pt' font='JetBrains Nerd Mono ExtraBold'>{calendar}</span>";
      calendar = {
        mode = "month";
        mode-mon-col = 3;
        on-scroll = 1;
        on-click-right = "mode";
        format = {
          months = "<span color='#5e81ac'><b>{}</b></span>";
          days = "<span color='#88c0d0'><b>{}</b></span>";
          weekdays = "<span color='#d08770'><b>{}</b></span>";
          today = "<span color='#bf616a'><b><u>{}</u></b></span>";
        };
      };
    };
    "hyprland/workspaces" = {
      active-only = false;
      all-outputs = false;
      disable-scroll = false;
      on-scroll-up = "hyprctl dispatch workspace e-1";
      on-scroll-down = "hyprctl dispatch workspace e+1";
      format = "{name}";
      on-click = "activate";
      format-icons = {
        urgent = "";
        active = "";
        default = "";
        sort-by-number = true;
      };
    };
    "hyprland/window" = {
      format = "{}";
      rewrite = {
        "(.*) - Google Chrome" = "chrome";
      };
    };
    temperature = {
      hwmon-path-abs = "/sys/devices/pci0000:00/0000:00:18.3/hwmon";
      input-filename = "temp1_input";
      critical-threshold = 80;
      format = "{temperatureC}°C {icon}";
      format-icons = ["" "" ""];
      interval = 5;
    };
    "custom/playerctl#backward" = {
      format = "󰙣 ";
      on-click = "playerctl previous";
      on-scroll-up = "playerctl volume .05+";
      on-scroll-down = "playerctl volume .05-";
    };
    "custom/playerctl#play" = {
      format = "{icon}";
      return-type = "json";
      exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      on-click = "playerctl play-pause";
      on-scroll-up = "playerctl volume .05+";
      on-scroll-down = "playerctl volume .05-";
      format-icons = {
        Playing = "<span>󰏥 </span>";
        Paused = "<span> </span>";
        Stopped = "<span> </span>";
      };
    };
    "custom/playerctl#foward" = {
      format = "󰙡 ";
      on-click = "playerctl next";
      on-scroll-up = "playerctl volume .05+";
      on-scroll-down = "playerctl volume .05-";
    };
    "custom/playerlabel" = {
      format = "<span>{}</span>";
      return-type = "json";
      max-length = 48;
      exec = "playerctl --player=NeteaseCloudMusicGtk -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
      on-click-middle = "playerctl play-pause";
      on-click = "playerctl previous";
      on-click-right = "playerctl next";
      format-icons = {
        Playing = "<span foreground='#E5B9C6'>󰒮 󰐌 󰒭</span>";
        Paused = "<span foreground='#928374'>󰒮 󰏥 󰒭</span>";
      };
    };
    memory = {
      format = " {}%";
      format-alt = " {used} GiB"; # 
      interval = 2;
    };
    cpu = {
      format = "  {usage}%";
      format-alt = "  {avg_frequency} GHz";
      interval = 2;
    };
    disk = {
      path = "/persistent";
      format = "󰋊 {percentage_used}%";
      interval = 60;
    };
    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = " {bandwidthUpBytes}  {bandwidthDownBytes}";
      tooltip-format = "Connected to {essid}{ifname} ip {ipaddr}/{cidr} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
      interval = 1;
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰖁 ";
      format-icons = {
        default = [" "];
      };
      scroll-step = 5;
      on-click = "pamixer -t";
    };
    "custom/launcher" = {
      format = "";
      on-click = "pkill wofi || wofi --show drun";
      on-click-right = "pkill wofi || wallpaper-picker";
      tooltip = "false";
    };
  };
}
