# fuzzing-benchmarks

This repository contains a collection of benchmarks and seed inputs to make fuzzing more easily comparable and reproducable. 

For instructions on installing and running a given benchmark, refer to the `readme` file in is respective directory.


## Benchmark Stats

libname/progname | 1-min dump size | projected 1-day dump size | inputs/sec | type 
--- | --- | --- | --- | --- 
binutils/readelf | 2.4M | 4.1G | 427 | dev 
libpng/pngtest | 331K |	476M | X | image 
libjpeg/djpeg |	615K | 	885M | 442 | image 
giflib/gif2rgb | 8.4M |	12.1G | X | image
libarchive/bsdtar | 90M	| 25G | 657 | archive	
libressl/openssl |1.5M | 1.7G | 22 | crypto
tcpdump/tcpdump	| 5.8M | 2.9G | 917 | network	
flac/flac | 400M | 576G | X | audio
audiofile/sfconvert | 771K | 1.11G | 1176 | audio
libxml/xmllint | 1.0M | 1.44G | 794 | web
poppler/pdftohtml | 512K | 737M | 49 | office

## Creating an Input Corpus

* Create a virtual machine with 1 processor and 6 GB of RAM and add a host-only adapter
* Install an ssh server on the VM
* Build `afl` and `afl-qemu`
* Build each desired benchmark following the instructions in its directory
* Shutdown the VM
* Make 7 copies of the VM
* Start the VMs in headless mode and connect to each using ssh
* In each VM:
```
sudo su
echo core > /proc/sys/kernel/core_pattern
exit
cd /path/to/afl
```
* For each VM, pick run one of the following (examples):
```
./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/binutils/seed_dir -o /media/sf_hugeData/readelf -t 9999 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/binutils/binutils-2.30/binutils/readelf -a @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/libjpeg/seed_dir/ -o /media/sf_hugeData/djpeg -t 9999 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/libjpeg/jpeg-9c/djpeg @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/libarchive/seed_dir/ -o /media/sf_hugeData/bsdtar -t 9999 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/libarchive/libarchive-3.3.2/bsdtar -O -xf @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/libressl/seed_dir/ -o /media/sf_hugeData/openssl -t 9999 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/libressl/libressl-2.1.6/apps/openssl x509 -in @@ -text -noout

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/tcpdump/seed_dir/ -o /media/sf_hugeData/tcpdump -t 9999 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/tcpdump/tcpdump-4.9.2/tcpdump -nr @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/audiofile/seed_dir/ -o /media/sf_hugeData/sfconvert -t 9999 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/audiofile/audiofile-0.2.7/sfcommands/sfconvert @@ out.mp3 format aiff

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/libxml/seed_dir/ -x /home/fuzz/Desktop/fuzzing-benchmarks/libxml/xml.dict -o /media/sf_hugeData/xml -t 9999 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/libxml/libxml2-2.7.7/xmllint -o /dev/null @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/poppler/seed_dir/ -x /home/fuzz/Desktop/fuzzing-benchmarks/poppler/pdf.dict -o /media/sf_hugeData/pdftohtml -t 9999 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/poppler/poppler-0.22.5/utils/pdftohtml @@
```
