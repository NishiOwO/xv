#!/bin/sh
NUM=`grep processor /proc/cpuinfo | wc -l | sed "s/ //g"`
export IMAKECPP="`which gcpp || which cpp`"
if [ "$NUM" = "0" ]; then
	NUM=4
fi
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
