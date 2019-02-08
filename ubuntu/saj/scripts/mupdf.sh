#!/bin/sh
cd ~/dev/git

if [ -d mupdf ]; then
    cd mupdf
    git pull
else
    git clone --recursive git://git.ghostscript.com/mupdf.git
    cd mupdf 
fi

make && ln -nsf ~/dev/git/mupdf/build/release/mupdf-gl ~/.local/bin/mupdf
