{
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
      "network"
    ];
    modules-center = [
      "cava#left"
      "hyprland/workspaces"
      "cava#right"
    ];
    modules-right = [
      "tray"
      "cpu"
      "memory"
      "disk"
      "pulseaudio"
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
    "cava#left" = {
      "autosens" = 1;
      "bar_delimiter" = 0;
      "bars" = 14;
      "sleep_timer" = 3;
      #"hide_on_silence" = true;
      "format-icons" = [
        "<span foreground='#cba6f7'>▁</span>"
        "<span foreground='#cba6f7'>▂</span>"
        "<span foreground='#cba6f7'>▃</span>"
        "<span foreground='#cba6f7'>▄</span>"
        "<span foreground='#89b4fa'>▅</span>"
        "<span foreground='#89b4fa'>▆</span>"
        "<span foreground='#89b4fa'>▇</span>"
        "<span foreground='#89b4fa'>█</span>"
      ];
      "framerate" = 60;
      "higher_cutoff_freq" = 10000;
      "input_delay" = 2;
      "lower_cutoff_freq" = 50;
      "method" = "pipewire";
      "monstercat" = false;
      "reverse" = false;
      "source" = "auto";
      "stereo" = true;
      "waves" = false;
    };
    "cava#right" = {
      "autosens" = 1;
      "bar_delimiter" = 0;
      "bars" = 14;
      "sleep_timer" = 3;
      #"hide_on_silence" = true;
      "format-icons" = [
        "<span foreground='#cba6f7'>▁</span>"
        "<span foreground='#cba6f7'>▂</span>"
        "<span foreground='#cba6f7'>▃</span>"
        "<span foreground='#cba6f7'>▄</span>"
        "<span foreground='#89b4fa'>▅</span>"
        "<span foreground='#89b4fa'>▆</span>"
        "<span foreground='#89b4fa'>▇</span>"
        "<span foreground='#89b4fa'>█</span>"
      ];
      "framerate" = 60;
      "higher_cutoff_freq" = 10000;
      "input_delay" = 2;
      "lower_cutoff_freq" = 50;
      "method" = "pipewire";
      "monstercat" = false;
      "reverse" = false;
      "source" = "auto";
      "stereo" = true;
      "waves" = false;
    };
    temperature = {
      #hwmon-path-abs = "/sys/devices/pci0000:00/0000:00:18.3/hwmon";
      #input-filename = "temp1_input";
      hwmon-path = [
        "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp1_input"
        "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input"
      ];
      critical-threshold = 80;
      format = "{icon} {temperatureC}°C";
      format-icons = ["" "" ""];
      interval = 5;
    };
    "custom/playerlabel" = {
      format = "{}";
      return-type = "json";
      max-length = 60;
      exec = "waySong 2> /dev/null";
      on-click-middle = "playerctl play-pause";
      on-click = "playerctl previous";
      on-click-right = "playerctl next";
      interval = 1;
    };
    memory = {
      format = " {used} GiB"; # 
      format-alt = " {}%";
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
      format-ethernet = " {bandwidthDownBytes}"; #  {bandwidthUpBytes}
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
