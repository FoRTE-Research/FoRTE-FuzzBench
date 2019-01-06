# FoRTE-fuzz-benchmarks

This repository contains a collection of benchmarks and seed inputs to make fuzzing more easily comparable and reproducable. We selcome any suggested additions to this benchmark corpus.

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
We provide the script `buildAll.sh` to compiile all benchmarks from source. 
Edit the following parameters to reflect the desired C and C++ compilers, and any assembler parameters:
```
compiler=""
compilerXX=""
passToAS=""
```

## Collecting Benchmarks
We also provide the script `collectAll.py` to copy all compiled benchmarks to the current directory and append them with a user-specific postfix:

You must supply the path to your local copy of the `FoRTE-fuzz-benchmarks` repository in the parameter `basePath`:
```
basePath="/path/to/FoRTE-fuzz-benchmarks/"
```

Then, run as follows:
```
python /path/to/FoRTE-fuzz-benchmarks/collectAll.py [postfix] 
```

All benchmarks will be copied and appended to the current directory and appended the specified postfix (leave blank if none).
