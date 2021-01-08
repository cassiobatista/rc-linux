#xscreensaver -no-splash &
setxkbmap -layout br &
xrdb -merge $HOME/.Xresources &
feh --bg-scale $HOME/git-casso/dotfiles/.wallpapers/vangogh_tardis.jpg &
xrandr --output HDMI1 --primary --auto --mode 1920x1080 && xrandr --output eDP1 --off || echo "no HDMI" &
xmonad --recompile && exec xmonad
