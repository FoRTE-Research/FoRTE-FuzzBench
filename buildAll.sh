#!/bin/bash

#compiler="clang"
#compilerXX="clang++"
compiler="afl-clang"
compilerXX="afl-clang++"
passToAS=""

baseDir=`pwd`

find . -maxdepth 1 -type d -exec bash -c "cd {}; pwd; tar -xf *.tar.*" \;

cd audiofile/audiofile-0.2.7 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd binutils/binutils-2.30 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie"  || exit 1
make all  || exit 1
cd $baseDir

cd cjson/cjson-1.7.7 || exit 1
make clean
make distclean
CC=$compiler CXX=$compilerXX CFLAGS="${passToAS} -g -O2 -no-pie -Wno-error" make all || exit 1
cd fuzzing || exit 1
CC=$compiler CXX=$compilerXX CFLAGS="${passToAS} -g -O2 -no-pie -Wno-error" make all  || exit 1
cd $baseDir

cd libarchive/libarchive-3.3.2 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -Wall -Wformat -Wformat-security -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd libjpeg/jpeg-9c || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd libksba/libksba-1.3.5 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -Wall -Wcast-align -Wshadow -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -fvisibility=hidden -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd poppler/poppler-0.22.5 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -Wall -g -O2 -no-pie" CXXFLAGS="${passToAS} -Wall -Woverloaded-virtual -Wnon-virtual-dtor -Wcast-align -fno-exceptions -fno-check-new -fno-common -g -O2 -ansi -no-pie" || exit 1
make all  || exit 1
cd $baseDir

cd tcpdump/tcpdump-4.9.2 || exit 1
make clean
make distclean
./configure --disable-shared CC=${compiler} CXX=${compilerXX} CFLAGS="${passToAS} -g -O2 -no-pie" || exit 1
make all  || exit 1
cd $baseDir
