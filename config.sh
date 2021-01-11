#!/usr/bin/env bash
#
# author: jan 2021
# cassio batista - https://cassota.gitlab.io

for f in yay git nvim NetworkManager ; do
  if [ ! type -f "$f" > /dev/null ] ; then
    echo "$0: please install $f"
    exit 1
  fi
done

mkdir -p $HOME/.config/nvim/bundle
mkdir -p $HOME/.config/conky
mkdir -p $HOME/.config/xmobar
mkdir -p $HOME/.xmonad

cp -rv init.vim         $HOME/.config/nvim
cp -rv conky.conf       $HOME/.config/conky
cp -rv Xresources       $HOME/.Xresources
cp -rv xinitrc          $HOME/.xinitrc
cp -rv tmux.conf        $HOME/.tmux.conf
cp -rv xmonad/xmonad.hs $HOME/.xmonad
cp -rv xmonad/icons     $HOME/.xmonad
cp -rv xmonad/xmobarrc  $HOME/.config/xmobar

# system packages
# https://superuser.com/questions/568967/prevent-pacman-from-reinstalling-packages-that-were-already-installed
sudo pacman -S --needed \
  xorg xorg-drivers xorg-xinit \
  nvidia cuda cudnn bumblebee \
  evince libreoffice-still texlive-bin texlive-core texlive-latexextra \
  xmonad xmonad-contrib xmobar \
  ttf-dejavu ttf-nerd-fonts-symbols \
  alsa-tools alsa-utils sox pavucontrol ffmpeg mpv \
  rxvt-unicode zsh tmux \
  hplip xsane cups \
  nodejs yarn powerline python-pynvim \
  firefox wget ntfs-3g htop scrot dunst conky libnotify \
  lolcat cowsay fortune-mod \
  python-numpy python-matplotlib python-scipy python-scikit-learn ipython

# aur
yay -S \
  google-chrome dropbox \
  ttf-dejavu-sans-mono-powerline-git ttf-font-awesome-4 ttf-ms-fonts \
  abntex2 warsaw-bin

yay -S gcc8 gcc8-fortran gcc8-libs  # separated bc it takes a fucking while

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# plugins for neovim
cd $HOME/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
git clone https://github.com/iamcco/markdown-preview.nvim
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
cd -
