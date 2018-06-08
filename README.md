# fuzzing-benchmarks

This repository contains a collection of benchmarks and seed inputs for easy fuzzing. 

For instructions on installing and running any benchmark, please refer to its respective `readme` file.


## Benchmark Stats

libname/progname | 1-min dump size | projected 1-day dump size | type 
--- | --- | --- | --- 
binutils/readelf | 2.4M | 3.5G | bin 
libpng/pngtest | 331K |	476M | image 
libjpeg/djpeg |	615K | 	885M | image 
giflib/gif2rgb | 8.4M |	12G	| image
libarchive/bsdtar | 90M	| 130G | archive	
libressl/openssl |1.5M | 2.2G |	auth
tcpdump/tcpdump	| 5.8M | 8.35G | network	
flac/flac | 400M | 576G | audio
audiofile/sfconvert | 771K | 1.11G| audio