#!/bin/sh
rm -f *.o xv
gmake -C tiff clean
gmake -C png clean
gmake -C jpeg clean
gmake -C zlib clean
rm -f jpeg/configured
rm -f zlib/configured
rm -f tiff/built
rm -f png/built
rm -f jpeg/built
rm -f zlib/built
