#!/bin/sh
NUM=4
xmkmf || exit 1
gmake depend
cd jpeg
./configure || exit 1
gmake -j$NUM || exit 1
cd ..
cd tiff
xmkmf || exit 1
gmake -j$NUM || exit 1
cd ..
gmake -j$NUM
