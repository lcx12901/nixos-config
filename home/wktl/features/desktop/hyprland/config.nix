{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    extraConfig = ''
      $mainMod = SUPER

      monitor=,highrr,auto,1
      # monitor=DP-1,2560x1440@165,0x0,1

      # autostart
      exec-once = systemctl --user import-environment &
      exec-once = hash dbus-update-activation-environment 2>/dev/null &
      exec-once = dbus-update-activation-environment --systemd &
      exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
      exec-once = hyprctl setcursor Nordzy-cursors 22 &
      exec-once = waybar &
      exec-once = mako
      exec-once = sleep 1 && swww init && swww img ~/.config/wallpapers/72125571_p0.jpg

      # fcitx5
      windowrule=pseudo,fcitx    # enable this will make fcitx5 works, but fcitx5-configtool will not work!
      exec-once = fcitx5 -d --replace     # start fcitx5 daemon
      bind=ALT,E,exec,pkill fcitx5 -9;sleep 1;fcitx5 -d --replace; sleep 1;fcitx5-remote -r


      input {
        kb_layout = us
        numlock_by_default = true
        follow_mouse = 1
        sensitivity = 0
      }

      misc {
        disable_autoreload = true
        disable_hyprland_logo = true
        always_follow_on_dnd = true
        layers_hog_keyboard_focus = true
        animate_manual_resizes = false
        enable_swallow = true
        # swallow_regex =
        focus_on_activate = true
      }

      general {
        layout = dwindle

        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = rgb(cba6f7) rgb(94e2d5) 45deg
        col.inactive_border = 0x00000000
        border_part_of_window = false
      }

      xwayland {
        force_zero_scaling = true
      }

      dwindle {
        no_gaps_when_only = false
        force_split = 0
        special_scale_factor = 1.0
        split_width_multiplier = 1.0
        use_active_for_splits = true
        pseudotile = yes
        preserve_split = yes
      }

      master {
        new_is_master = true
        special_scale_factor = 1
        no_gaps_when_only = false
      }

      decoration {
        rounding = 12

        active_opacity = 0.90;
        inactive_opacity = 0.90;
        fullscreen_opacity = 1.0;

        blur {
          enabled = true

          size = 3
          passes = 3

          brightness = 1
          contrast = 1.300000
          ignore_opacity = true
          noise = 0.011700

          new_optimizations = true

          xray = true
        }

        drop_shadow = true;

        shadow_ignore_window = true;
        shadow_offset = 0 2
        shadow_range = 20
        shadow_render_power = 3
        col.shadow = rgba(00000055)
      }

      animations {
        enabled = true

        bezier = fluent_decel, 0, 0.2, 0.4, 1
        bezier = easeOutCirc, 0, 0.55, 0.45, 1
        bezier = easeOutCubic, 0.33, 1, 0.68, 1
        bezier = easeinoutsine, 0.37, 0, 0.63, 1

        # Windows
        animation = windowsIn, 1, 3, easeOutCubic, popin 30% # window open
        animation = windowsOut, 1, 3, fluent_decel, popin 70% # window close.
        animation = windowsMove, 1, 2, easeinoutsine, slide # everything in between, moving, dragging, resizing.

        # Fade
        animation = fadeIn, 1, 3, easeOutCubic  # fade in (open) -> layers and windows
        animation = fadeOut, 1, 2, easeOutCubic # fade out (close) -> layers and windows
        animation = fadeSwitch, 0, 1, easeOutCirc # fade on changing activewindow and its opacity
        animation = fadeShadow, 1, 10, easeOutCirc # fade on changing activewindow for shadows
        animation = fadeDim, 1, 4, fluent_decel # the easing of the dimming of inactive windows
        animation = border, 1, 2.7, easeOutCirc # for animating the border's color switch speed
        animation = borderangle, 1, 30, fluent_decel, once # for animating the border's gradient angle - styles: once (default), loop
        animation = workspaces, 1, 4, easeOutCubic, fade # styles: slide, slidevert, fade, slidefade, slidefadevert
      }

      # ----------------------------------------------------------------

      # show keybinds list
      bind = $mainMod, F1, exec, show-keybinds

      # keybindings
      bind = $mainMod, W, exec, pkill wofi || wofi --show drun
      bind = $mainMod, Return, exec, kitty
      # bind = $mainMod SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'
      bind = $mainMod, G, exec, chromium --gtk-version=4 --enable-features=UseOZonePlatform --ozone-platform=wayland
      bind = $mainMod, M, exec, netease-cloud-music-gtk4
      bind = $mainMod, T, exec, telegram-desktop
      bind = $mainMod, B, exec, bytedance-feishu
      bind = $mainMod, F, fullscreen, 0            # 全屏（占据整个屏幕）
      bind = $mainMod SHIFT, F, fullscreen, 1      # 最大化（保留间隙和条形）
      bind = $mainMod, Space, togglefloating,      # 切换当前窗口的浮动状态
      bind = $mainMod, C, killactive,              # 关闭活动窗口
      bind = $mainMod SHIFT, W, exec, pkill waybar || waybar &
      bind = $mainMod, L, exec, hyprlock

      bind=$mainMod,bracketleft,exec,grimblast --notify --cursor  copysave area ~/Pictures/Screenshots/$(date "+%Y-%m-%d"T"%H:%M:%S").png
      bind=$mainMod,bracketright,exec, grimblast --notify --cursor  copy area

      # switch focus
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # switch workspace
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # same as above, but switch to the workspace
      bind = $mainMod SHIFT, 1, movetoworkspace, 1     # movetoworkspacesilent
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
      bind = $mainMod CTRL, c, movetoworkspace, empty

      bind = $mainMod, a, togglespecialworkspace, magic
      bind = control SHIFT, S, movetoworkspace, special:magic

      # window control
      bind = $mainMod SHIFT, left, movewindow, l
      bind = $mainMod SHIFT, right, movewindow, r
      bind = $mainMod SHIFT, up, movewindow, u
      bind = $mainMod SHIFT, down, movewindow, d
      bind = $mainMod CTRL, left, resizeactive, -80 0
      bind = $mainMod CTRL, right, resizeactive, 80 0
      bind = $mainMod CTRL, up, resizeactive, 0 -80
      bind = $mainMod CTRL, down, resizeactive, 0 80
      bind = $mainMod ALT, left, moveactive,  -80 0
      bind = $mainMod ALT, right, moveactive, 80 0
      bind = $mainMod ALT, up, moveactive, 0 -80
      bind = $mainMod ALT, down, moveactive, 0 80

      # mouse binding
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # windowrule
      windowrule = float,audacious
      windowrule = workspace 8 silent, audacious
      windowrule = pin,wofi
      windowrule = float,wofi
      windowrule = noborder,wofi

      windowrulev2 = float,class:^(org.telegram.desktop|telegramdesktop)$
      windowrulev2 = float,title:飞书
      windowrulev2 = float,title:图片
      windowrulev2 = float,title:NetEase Cloud Music Gtk4
      windowrulev2 = float,class:^(org.gnome.Nautilus|nautilus)$
      windowrulev2 = float,class:^(kitty)$
      windowrulev2 = float,class:discord
      windowrulev2 = float,title:^(Devtools)
    '';
  };
}
