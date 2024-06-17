#!/usr/bin/env bash

# You can call this script like this:
# $ ./volumeControl.sh up
# $ ./volumeControl.sh down
# $ ./volumeControl.sh mute

# Script modified from these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function send_notification {
  id=2593

  if ! [ $1 -eq 0 ]; then
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq --separator="─" 0 "$((22 * $1 / 100))" | sed 's/[0-9]//g')
    icon="audio-volume-high"
  else
    bar=" "
    icon="audio-volume-muted"
  fi

  dunstify --icon=$icon --replace=$id --urgency=low "$bar "
}

case $1 in
  up)
    # set the volume on (if it was muted)
    amixer -D pulse set Master on > /dev/null
    volume=$(amixer -D pulse sset Master 5%+ | grep --only-matching --max-count=1 --perl-regexp '\d+(?=%\] \[on\]$)' || echo 0)
    send_notification volume
    ;;
  down)
    amixer -D pulse set Master on > /dev/null
    volume=$(amixer -D pulse sset Master 5%- | grep --only-matching --max-count=1 --perl-regexp '\d+(?=%\] \[on\]$)' || echo 0)
    send_notification volume
    ;;
  mute)
    # toggle mute
    amixer -D pulse set Master 1+ toggle > /dev/null
    send_notification 0
    ;;
esac
