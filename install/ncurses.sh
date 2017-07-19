#!/usr/bin/env bash

mkdir -p $HOME/.ncurses_db
wget --directory-prefix=$HOME/.ncurses_db http://invisible-island.net/datafiles/current/terminfo.src.gz
gunzip $HOME/.ncurses_db/terminfo.src.gz
tic -x $HOME/.ncurses_db/terminfo.src
