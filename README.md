# FoRTE-fuzz-benchmarks

This repository contains a collection of benchmarks and seed inputs to make fuzzing more easily comparable and reproducable. 

For instructions on installing and running a given benchmark, refer to the `readme` file in its respective directory.

|             |                |
|-------------|----------------|
|**AUTHOR:**  | Stefan Nagy  |
|**EMAIL:**   | snagy2@vt.edu |
|**LICENSE:** | [MIT License](LICENSE) |
|**DISCLAIMER:**   | This software is strictly a research prototype. |

## Benchmark Statistics
progname | libname | basic blocks | edges (outgoing) | edges (incoming)
--- | --- | --- | --- | ---
bsdtar		|libarchive |31032	|43390	|43432
cert-basic	|libksba	|9897	|14120	|14120
cjson 		|cjson		|1377	|2038 	|2038
djpeg		|libjpeg	|4763	|6776	|6776
pdftohtml	|poppler	|54375	|71945 	|71945
readelf		|binutils	|21085	|31086 	|31270
sfconvert	|audiofile	|5496	|7403 	|7403
tcpdump		|tcpdump	|33229	|48791	|48810
flac		|flac		|		|		|
gif2rgb		|giflib		|		|		|
pngtest		|libpng		|		|		|


## Building Benchmarks

## Collecting Benchmarks

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
