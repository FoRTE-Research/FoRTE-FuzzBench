# fuzzing-benchmarks

This repository contains a collection of benchmarks and seed inputs for easy fuzzing. 

For instructions on installing and running any benchmark, please refer to its respective `readme` file.


## Benchmark Stats

libname/progname | 1-min dump size | projected 1-day dump size | inputs/sec | type 
--- | --- | --- | --- | --- 
binutils/readelf | 2.4M | 3.46G | 427 | dev 
libpng/pngtest | 331K |	476M | X | image 
libjpeg/djpeg |	615K | 	885M | 442 | image 
giflib/gif2rgb | 8.4M |	12.1G | X | image
libarchive/bsdtar | 90M	| 130G | 657 | archive	
libressl/openssl |1.5M | 2.16G | 22 | crypto
tcpdump/tcpdump	| 5.8M | 8.35G | 917 | network	
flac/flac | 400M | 576G | X | audio
audiofile/sfconvert | 771K | 1.11G | 1176 | audio
libxml/xmllint | 1.0M | 1.44G | 794 | web
poppler/pdftohtml | 512K | 737M | X | office
