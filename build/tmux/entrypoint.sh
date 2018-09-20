#!/bin/bash

NCURSES_VERSION="v6.1"
VIM_VERSION="v8.1.0346"

cd /tmp

# https://github.com/mirror/ncurses/tags
#wget https://github.com/mirror/ncurses/archive/$NCURSES_VERSION.tar.gz
wget http://download.ryerh.com/v6.1.tar.gz
tar -zxf $NCURSES_VERSION.tar.gz
cd /tmp/ncurses-*
./configure
make -j8
make install

# https://github.com/vim/vim/tags
#wget https://github.com/vim/vim/archive/$VIM_VERSION.tar.gz
wget http://download.ryerh.com/v8.1.0346.tar.gz
tar -zxf $VIM_VERSION.tar.gz
cd /tmp/vim-*
./configure --enable-pythoninterp=yes
make -j8
make install

vim --version
