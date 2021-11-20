#!/usr/bin/env bash
#
# author: jan 2021
# cassio batista - https://cassota.gitlab.io

for f in yay git nvim NetworkManager ; do
  ! type -f "$f" > /dev/null 2>&1 && echo "$0: please install $f" && exit 1
done

mkdir -p $HOME/.config/nvim/bundle
mkdir -p $HOME/.config/conky
mkdir -p $HOME/.config/xmobar
mkdir -p $HOME/.xmonad

cp -rvn vim/init.vim     $HOME/.config/nvim
cp -rvn vim/syntax       $HOME/.config/nvim
cp -rvn conky.conf       $HOME/.config/conky
cp -rvn xmobarrc         $HOME/.config/xmobar
cp -rvn Xresources       $HOME/.Xresources
cp -rvn xinitrc          $HOME/.xinitrc
cp -rvn tmux.conf        $HOME/.tmux.conf
cp -rvn xmonad/xmonad.hs $HOME/.xmonad
cp -rvn xmonad/icons     $HOME/.xmonad

# system packages
# NOTE powerline-fonts breaks up things. use ttf-dejavu-sans-mono-powerline instead
# nvidia cuda cudnn bumblebee \
sudo pacman -S --needed \
  xorg xorg-xinit xorg-apps xscreensaver numlockx \
  xf86-video-intel xf86-video-fbdev xf86-input-libinput \
  jdk-openjdk jre-openjdk \
  evince libreoffice-still diffpdf pdftk zathura zathura-pdf-poppler \
  texlive-bin texlive-core texlive-latexextra \
  texlive-bibtexextra texlive-fontsextra texlive-pictures \
  xmonad xmonad-contrib xmobar dmenu \
  ttf-dejavu ttf-nerd-fonts-symbols noto-fonts-emoji \
  awesome-terminal-fonts powerline python-powerline \
  alsa-tools alsa-utils sox ffmpeg portaudio pulseaudio pulseaudio-bluetooth pavucontrol \
  mpv cmus mpd mpc playerctl \
  rxvt-unicode zsh tmux subversion gcc-fortran \
  hplip xsane cups bluez bluez-utils bluez-libs \
  nodejs yarn python-pynvim \
  firefox unzip wget ntfs-3g lshw rsync openssh htop tree scrot dunst conky libnotify dmidecode mlocate \
  gimp mediainfo imagemagick feh \
  lolcat cowsay fortune-mod \
  python2 python-numpy python-matplotlib python-scipy ipython tk \
  openfortivpn telegram-desktop docker

# aur
yay -S --needed \
  google-chrome dropbox \
  ttf-font-awesome-4 ttf-ms-fonts ttf-dejavu-sans-mono-powerline-git \
  urxvt-resize-font-git \
  foxitreader abntex2

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# plugins for neovim
cd $HOME/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
git clone https://github.com/iamcco/markdown-preview.nvim
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
cd -
