#!/bin/bash

#compiler="clang"
#compilerXX="clang++"
compiler="afl-clang"
compilerXX="afl-clang++"
passToAS="-Wa,-F"

baseDir=`pwd`

export PATH=$PATH:/home/mdhicks2/Desktop/afl
export AFL_PATH=/home/mdhicks2/Desktop/afl
export AFL_DONT_OPTIMIZE=1

find . -maxdepth 1 -type d -exec bash -c "cd {}; pwd; tar -xf *.tar.*" \;

cd binutils/binutils-2.30 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie"  || exit 1
make all  || exit 1
cd $baseDir

cd libjpeg/jpeg-9c || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd libarchive/libarchive-3.3.2 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -Wall -Wformat -Wformat-security -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd tcpdump/tcpdump-4.9.2 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd audiofile/audiofile-0.2.7 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd poppler/poppler-0.22.5 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -Wall -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd libpng/libpng-1.6.34 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd giflib/giflib-5.1.4 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -Wall -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd flac/flac-1.3.2 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -O3 -funroll-loops -g  -Wall -Wextra -Wstrict-prototypes -Wmissing-prototypes -Waggregate-return -Wcast-align -Wnested-externs -Wshadow -Wundef -Wmissing-declarations -Winline  -Wdeclaration-after-statement -D_FORTIFY_SOURCE=2 -fvisibility=hidden -msse2 -no-pie"  || exit 1
make all  || exit 1
cd $baseDir

cd libksba/libksba-1.3.5 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -Wall -Wcast-align -Wshadow -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -fvisibility=hidden -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd harfbuzz/harfbuzz-1.8.1 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd cjson/cjson-1.7.7 || exit 1
make clean
make distclean
CC=$compiler CXX=$compilerXX CFLAGS="${passToAS} -g -O2 -no-pie -Wno-error" make all || exit 1
cd fuzzing || exit 1
CC=$compiler CXX=$compilerXX CFLAGS="${passToAS} -g -O2 -no-pie -Wno-error" make all  || exit 1
cd $baseDir
