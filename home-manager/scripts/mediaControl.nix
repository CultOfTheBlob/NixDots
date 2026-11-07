{
  pkgs,
  user,
  ...
}:
let
  assets = "/home/${user}/.nix/home-manager/modules/assets";
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "mediaControl" ''
      # Playerctl
      music_icon="${assets}/music.png"

      # Play the next track
      play_next() {
          ${pkgs.playerctl}/bin/playerctl next
          show_music_notification
      }

      # Play the previous track
      play_previous() {
          ${pkgs.playerctl}/bin/playerctl previous
          show_music_notification
      }

      # Toggle play/pause
      toggle_play_pause() {
          ${pkgs.playerctl}/bin/playerctl play-pause
          show_music_notification
      }

      # Stop playback
      stop_playback() {
          ${pkgs.playerctl}/bin/playerctl stop
          notify-send -e -u low -i "$music_icon" "Playback Stopped"
      }

      # Display notification with song information
      show_music_notification() {
          status=$(${pkgs.playerctl}/bin/playerctl status)
          if [[ "$status" == "Playing" ]]; then
              song_title=$(${pkgs.playerctl}/bin/playerctl metadata title)
              song_artist=$(${pkgs.playerctl}/bin/playerctl metadata artist)
              notify-send -e -u low -i "$music_icon" "Now Playing:" "$song_title\nby $song_artist"
          elif [[ "$status" == "Paused" ]]; then
              notify-send -e -u low -i "$music_icon" "Playback Paused"
          fi
      }

      # Get media control action from command line argument
      case "$1" in
          "--nxt")
              play_next
              ;;
          "--prv")
              play_previous
              ;;
          "--pause")
              toggle_play_pause
              ;;
          "--stop")
              stop_playback
              ;;
          *)
              echo "Usage: $0 [--nxt|--prv|--pause|--stop]"
              exit 1
              ;;
      esac
    '')
  ];
}
