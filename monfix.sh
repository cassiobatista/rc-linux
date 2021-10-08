#!/usr/bin/env bash

xrandr --output HDMI-1 --primary --mode 2560x1080 --right-of eDP-1
feh --bg-scale /home/cassio/git-casso/dotfiles/.wallpapers/vangogh_tardis.jpg &
sleep 1 && conky & #-a top_left -x 5 -y 50 -d
