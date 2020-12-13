#xscreensaver -no-splash &
setxkbmap -layout br &
feh --bg-scale $HOME/git-casso/dotfiles/.wallpapers/vangogh_tardis.jpg &
xrdb -merge $HOME/.Xresources &
xmonad --recompile && exec xmonad
