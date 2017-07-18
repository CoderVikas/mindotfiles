#!/usr/bin/env bash

mkdir -p ~/.ncurses_db
wget --directory-prefix=~/.ncurses_db http://invisible-island.net/datafiles/current/terminfo.src.gz
unzip ~/.ncurses_db/terminfo.src.gz
tic ~/.ncurses_db/terminfo.src
