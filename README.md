# FoRTE-fuzz-benchmarks

This repository contains a collection of benchmarks and seed inputs to make fuzzing more easily comparable and reproducable. For instructions on installing and running a given benchmark, refer to the `readme` file in its respective directory.

**We welcome any suggested additions to this fuzzing benchmark corpus.**

|             |                |
|-------------|----------------|
|**AUTHOR:**  | Stefan Nagy  |
|**EMAIL:**   | snagy2@vt.edu |
|**LICENSE:** | [MIT License](LICENSE) |
|**DISCLAIMER:**   | This software is strictly a research prototype. |

### Benchmark Statistics
We utilized [Dyninst](https://dyninst.org/) to compute the following bechmark statistics for the 8 binaries evaluated in our paper *[
Full-speed Fuzzing: Reducing Fuzzing Overhead through Coverage-guided Tracing](https://arxiv.org/abs/1812.11875)*. Note that we compiled all with Clang/Clang++, and ignore [a number of](https://github.com/FoRTE-Research/UnTracer-AFL/blob/master/UnTracerDyninst.cpp#L378) compiler-inserted initialization functions.  

benchname | libname | basic blocks | edges (outgoing) | edges (incoming)
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

For our paper we collected statistics on the 24hr fuzzing testcase corpora for each benchmark. Note that these numbers reflect corpora generated using [AFL](http://lcamtuf.coredump.cx/afl/) with QEMU-based tracing.

benchname | libname | type | 24hr corpus size | testcases/24hr | 100ms timeouts
--- | --- | --- | --- | --- | ---
bsdtar		|libarchive |dev 	| 90.9G | 25.6M | 4 
cert-basic	|libksba	|crypto | 7.5G 	| 10.7M | 6 
cjson 		|cjson		|web 	| 4.5G 	| 14.5M | 221K 	
djpeg		|libjpeg	|img 	| 30.1G | 21.0M | 656
pdftohtml	|poppler	|doc 	| 0.2G 	| 1.2M 	| 107 	
readelf		|binutils	|dev 	| 3.8G 	| 14.9M | 7 
sfconvert	|audiofile	|audio	| 3.7G 	| 10.1M | 373K 	
tcpdump		|tcpdump	|net	| 2.7G 	| 27.1M | 5 	
flac		|flac		|audio	|	|	| 
gif2rgb		|giflib		|img	|	|	| 
pngtest		|libpng		|img	|	|	|


## BUILDING
We provide the script `buildAll.sh` to compiile all benchmarks from source. 
Edit the following parameters to reflect the desired C and C++ compilers, and any assembler parameters:
```
compiler=""
compilerXX=""
passToAS=""
```

## COLLECTING
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
