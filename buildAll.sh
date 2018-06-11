#!/bin/bash

#compiler="gcc"
#compiler="g++"
compiler="afl-clang"
compilerXX="afl-clang++"

export PATH=$PATH:/home/mdhicks2/Desktop/afl
export AFL_PATH=/home/mdhicks2/Desktop/afl

cd binutils/binutils-2.30
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-g -O2 -no-pie"
make all
cd ../..

cd libjpeg/jpeg-9c
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-g -O2 -no-pie"
make all
cd ../..

cd libarchive/libarchive-3.3.2
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-g -O2 -Wall -Wformat -Wformat-security -no-pie"
make all
cd ../..

cd libressl/libressl-2.1.6
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-Wall -std=gnu99 -g -O2 -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -D_GNU_SOURCE  -fno-strict-overflow -D_FORTIFY_SOURCE=2 -fstack-protector-strong -Wno-pointer-sign -DHAVE_GNU_STACK -no-pie"
make all
cd ../..

cd tcpdump/tcpdump-4.9.2
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-g -O2 -no-pie"
make all
cd ../..

cd audiofile/audiofile-0.2.7
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-g -O2 -no-pie"
make all
cd ../../

cd libxml/libxml2-2.7.7
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-g -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -no-pie"
make all
cd ../..

cd poppler/poppler-0.22.5
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-Wall -g -O2 -no-pie"
make all
cd ../..

cd libpng/libpng-1.6.34
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-g -O2 -no-pie"
make all
cd ../..

cd giflib/giflib-5.1.4/
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-g -O2 -Wall -no-pie"
make all
cd ../..

cd flac/flac-1.3.2
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="-O3 -funroll-loops -g  -Wall -Wextra -Wstrict-prototypes -Wmissing-prototypes -Waggregate-return -Wcast-align -Wnested-externs -Wshadow -Wundef -Wmissing-declarations -Winline  -Wdeclaration-after-statement -D_FORTIFY_SOURCE=2 -fvisibility=hidden -msse2 -no-pie"
make all
cd ../..
