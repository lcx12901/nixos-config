{pkgs, ...}: {
  # touch ~/.config/mpd/{database,log,playlists,pid,state,sticker.sql}
  xdg.configFile."mpd/mpd.conf".text = ''
    # Required files
    db_file            "~/.config/mpd/database"
    log_file           "~/.config/mpd/log"

    # Optional
    music_directory    "~/Music"
    playlist_directory "~/.config/mpd/playlists"
    pid_file           "~/.config/mpd/pid"
    state_file         "~/.config/mpd/state"
    sticker_file       "~/.config/mpd/sticker.sql"
  '';
}
