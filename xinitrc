xscreensaver -no-splash &
setxkbmap -layout br &
xrdb -merge $HOME/.Xresources &
feh --bg-scale $HOME/git-casso/dotfiles/.wallpapers/vangogh_tardis.jpg &
numlockx &
xmonad --recompile && exec xmonad
