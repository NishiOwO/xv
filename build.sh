#!/bin/sh
CFLAGS="-Wno-error=implicit-function-declaration -Wno-error=implicit-int -Wno-error=int-conversion -Wno-error=incompatible-pointer-types"

export CC
export CFLAGS

NUM=`grep processor /proc/cpuinfo | wc -l | sed "s/ //g"`
export IMAKECPP="`which gcpp || which cpp13 || which cpp`"
if [ "$NUM" = "0" ]; then
	NUM=4
fi
xmkmf || exit 1
gmake depend

cd jpeg
if [ ! -e configured ]; then
	./configure || exit 1
	touch configured
fi
if [ ! -e built ]; then
	gmake -j$NUM || exit 1
	touch built
fi
cd ..

cd zlib
if [ ! -e configured ]; then
	./configure || exit 1
	touch configured
fi
if [ ! -e built ]; then
	gmake -j$NUM || exit 1
	touch built
fi
cd ..

cd png
if [ ! -e built ]; then
	gmake -j$NUM || exit 1
	touch built
fi
cd ..

cd tiff
if [ ! -e built ]; then
	xmkmf || exit 1
	gmake -j$NUM || exit 1
	touch built
fi
cd ..
gmake -j$NUM
