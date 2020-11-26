#!/usr/bin/env bash
FONTS_DIR="$HOME/.local/share/fonts"
RANGER_DIR="$HOME/.config/ranger/"
CUR_DIR=`pwd`

# rc files
ln -sf $CUR_DIR/.vimrc $HOME/;
ln -sf $CUR_DIR/.screenrc $HOME/;
ln -sf $CUR_DIR/.inputrc $HOME/;
perl scripts/append_bashrc_suffix.pl

# vim snips
mkdir -p ~/.vim/
ln -sf $CUR_DIR/UltiSnips ~/.vim/

# ranger
mkdir -p $RANGER_DIR && \
ln -sf $CUR_DIR/rc.conf ~/.config/ranger/ && \
ln -sf $CUR_DIR/rifle.conf ~/.config/ranger/;
