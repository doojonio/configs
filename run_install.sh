#!/usr/bin/env bash
FONTS_DIR="$HOME/.local/share/fonts"
RANGER_DIR="$HOME/.config/ranger/"
CUR_DIR=`pwd`

# rc files
ln -s $CUR_DIR/.vimrc $HOME/;
ln -s $CUR_DIR/.screenrc $HOME/;
ln -s $CUR_DIR/.inputrc $HOME/;
perl scripts/append_bashrc_suffix.pl

# ranger
mkdir -p $RANGER_DIR && \
ln -s $CUR_DIR/rc.conf ~/.config/ranger/ && \
ln -s $CUR_DIR/rifle.conf ~/.config/ranger/;

# jet brains mono nerd fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip" && \
mkdir -p $FONTS_DIR && \
mv JetBrainsMono.zip $FONTS_DIR && \
cd $FONTS_DIR && \
unzip JetBrainsMono.zip && \
fc-cache -fv && \
rm JetBrainsMono.zip;

cd $CUR_DIR;
