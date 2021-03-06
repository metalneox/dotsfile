#!/bin/sh

DIALOG_RESULT=$(echo -e 'Normal Video\nAudio no Video\nMini Video' | rofi -dmenu -i -p "[SYSTEM]" -hide-scrollbar -tokenize -lines 6 -eh 1 -width 25 -location 0 -xoffset 0 -yoffset 0 -padding 20 -disable-history -font "ClearSansMedium 14")

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Normal Video" ];
then
    notify-send -t 3000 --icon=video-display "Playing Video" "$(xclip -o)";
    mpv --ytdl-format=22 --fs "$(xclip -o)" || mpv --fs "$(xclip -o)";
elif [ "$DIALOG_RESULT" = "Audio no Video" ];
then
    notify-send -t 3000 --icon=video-display "Playing Video" "$(xclip -o)";
    mpv --no-video --ytdl-format=22 --fs "$(xclip -o)" || mpv --fs "$(xclip -o)";
elif [ "$DIALOG_RESULT" = "Mini Video" ];
then
    notify-send -t 3000 --icon=video-display "Playing Mini Video" "$(xclip -o)";
    mpv --ytdl-format=22 --title="mpvfloat" --geometry=20%x20%+100%+100% "$(xclip -o)" || mpv  --title="mpvfloat" --geometry=20%x20%+100%+100% "$(xclip -o)";
    #notify-send -t 3000 --icon=video-display "Non implementato";
fi



