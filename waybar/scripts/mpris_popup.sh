# filepath: /home/mv/.config/waybar/scripts/mpris_popup.sh
#!/bin/bash

# Get song details using playerctl
TITLE=$(playerctl metadata title)
ARTIST=$(playerctl metadata artist)
ALBUM=$(playerctl metadata album)
COVER_URL=$(playerctl metadata mpris:artUrl)

# Download the cover art to a temporary file
COVER_PATH="/tmp/mpris_cover.jpg"
if [[ -n "$COVER_URL" ]]; then
  curl -s "$COVER_URL" --output "$COVER_PATH"
else
  COVER_PATH="/home/mv/.config/waybar/scripts/default_cover.jpg" # Fallback cover art
fi

# Get screen dimensions to calculate the top-middle position
SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d 'x' -f 1)
WINDOW_WIDTH=400
WINDOW_HEIGHT=600
X_POS=$(( (SCREEN_WIDTH - WINDOW_WIDTH) / 2 ))
Y_POS=50 # Position near the top

# Create a yad window with song details and controls
while true; do
  yad --title="Now Playing" \
      --image="$COVER_PATH" \
      --image-on-top \
      --text="<b>Title:</b> $TITLE\n<b>Artist:</b> $ARTIST\n<b>Album:</b> $ALBUM" \
      --button="⏮ Previous:1" \
      --button="▶ Play/Pause:2" \
      --button="⏭ Next:3" \
      --button="Close:0" \
      --width=$WINDOW_WIDTH \
      --height=$WINDOW_HEIGHT \
      --posx=$X_POS \
      --posy=$Y_POS \
      --undecorated \
      --fixed \
      --center

  # Handle button clicks
  case $? in
    1) playerctl previous ;;  # Previous track
    2) playerctl play-pause ;; # Play/Pause
    3) playerctl next ;;      # Next track
    0) break ;;               # Close the window
  esac
done