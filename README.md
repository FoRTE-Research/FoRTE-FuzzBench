# FoRTE-fuzz-benchmarks

This repository contains a collection of benchmarks and seed inputs to make fuzzing more easily comparable and reproducable. 

For instructions on installing and running a given benchmark, refer to the `readme` file in its respective directory.

|             |                |
|-------------|----------------|
|**AUTHOR:**  | Stefan Nagy  |
|**EMAIL:**   | snagy2@vt.edu |
|**LICENSE:** | [MIT License](LICENSE) |
|**DISCLAIMER:**   | This software is strictly a research prototype. |

## Benchmark Stats

libname/progname | 1-day dump size | inputs/day | 100ms timeouts | basic blocks (dyninst) | type | afl-llvm | qemu | dyninst | ipt
--- | --- | --- | --- | --- | --- | --- | --- | --- | ---
binutils/readelf | 3.8G | 14.9M | 7 | 20673 | dev | [x] | [x] | [x]
libpng/pngtest | |  | | 8919 | image | [x] | [x] | [x]
libjpeg/djpeg | 	4.5G | 14.5M | 221K | 4348 | image | [x] | [x] | [x]
giflib/gif2rgb |	 |  | | 1660 | image | [x] | [x] | [x]
libarchive/bsdtar | 30.1G | 21.0M | 656 | 29915 | archive	| [x] | [x] |
tcpdump/tcpdump	| 2.7G | 27.1M | 5 | 29906 | network	| [x] | [x] | [x]
flac/flac |  |  | | 23414 | audio | [x] | [x] | [x]
audiofile/sfconvert | 3.7G | 10.1M | 373K | 5094 | audio | [x] | [x]
poppler/pdftohtml | 0.2G | 1.2M | 107 | 65699 | office | [x] | [x] | [x]
libksba/cert-basic | 7.5G | 10.7M | 6 | 13677 | crypto | [x] | [x] | 
harfbuzz/main | | | | 940 | office | | 
cjson/cjson | 90.9G | 25.6M | 4 | 1359 | web | [x] | [x] | 

## Collecting benchmark binaries

To gather the benchmark binary files in the top-level directory:

```
python collectBins.py
```

Make sure to verify that the base binaries are non-pie:

```
find . -maxdepth 1 -name "*Original" -exec bash -c "echo {}; readelf -l {} | grep Entry" \;
```


To gather and rename the benchmark binaries after building with `afl-clang`:

```
python collectBins.py -q
```
