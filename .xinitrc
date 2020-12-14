#xscreensaver -no-splash &
setxkbmap -layout br &
xrdb -merge $HOME/.Xresources &
xrandr --output HDMI1 --primary --above eDP1 --auto --mode 1920x1080 || echo "no HDMI" &
feh --bg-scale $HOME/git-casso/dotfiles/.wallpapers/vangogh_tardis.jpg &
xmonad --recompile && exec xmonad
