#!/usr/bin/env bash
#
# author: jan 2021
# cassio batista - https://cassota.gitlab.io

mkdir -p $HOME/.config/nvim/bundle
mkdir -p $HOME/.xmonad
mkdir -p $HOME/.config/xmobar

cp -v init.vim         $HOME/.config/nvim
cp -v Xresources       $HOME/.Xresources
cp -v xinitrc          $HOME/.xinitrc
cp -v tmux.conf        $HOME/.tmux.conf
cp -v xmonad/xmonad.hs $HOME/.xmonad
cp -v xmonad/icons     $HOME/.xmonad
cp -v xmonad/xmobarrc  $HOME/.config/xmobar

sudo pacman -S \
  neovim nodejs yarn powerline python-pynvim \
  ttf-dejavu ttf-nerd-fonts-symbols \
  rxvt-unicode zsh curl wget \
  xorg xorg-xinit xmonad xmonad-contrib xmobar nvidia cuda cudnn bumblebee \
  evince libreoffice-still texlive-bin texlive-core texlive-latexextra \
  firefox lolcat cowsay fortune tmux ntfs-3g \
  python-numpy python-matplotlib python-scipy python-scikit-learn ipython

yay -S \
  gcc8 gcc8-fortran gcc8-libs \
  google-chrome dropbox \
  ttf-dejavu-sans-mono-powerline-git ttf-font-awesome-4 ttf-ms-fonts \
  abntex2 warsaw-bin

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ~/.config/nvim/bundle

git clone git@github.com:VundleVim/Vundle.vim.git
git clone git@github.com:iamcco/markdown-preview.nvim
git clone git@github.com:vim-airline/vim-airline
git clone git@github.com:vim-airline/vim-airline-themes

cd -
