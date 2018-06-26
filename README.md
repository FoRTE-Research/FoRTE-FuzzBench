# fuzzing-benchmarks

This repository contains a collection of benchmarks and seed inputs to make fuzzing more easily comparable and reproducable. 

For instructions on installing and running a given benchmark, refer to the `readme` file in is respective directory.

## Benchmark Stats

libname/progname | 1-day dump size | inputs/day | 100 ms timeouts | type | afl-llvm | qemu | dyninst | ipt
--- | --- | --- | --- | --- | --- | --- | --- | ---
binutils/readelf | 3.8G | 14.9M | 7 | dev | [x] | [x] | [x]
libpng/pngtest | |  | | image | [x] | [x] | [x]
libjpeg/djpeg | 	4.5G | 14.5M | 221K | image | [x] | [x] | [x]
giflib/gif2rgb |	 |  | | image | [x] | [x] | [x]
libarchive/bsdtar | 30.1G | 21.0M | 656 | archive	| [x] | [x] |
tcpdump/tcpdump	| 2.7G | 27.1M | 5 | network	| [x] | [x] | [x]
flac/flac |  |  | | audio | [x] | [x] | [x]
audiofile/sfconvert | 3.7G | 10.1M | 373K | audio | [x] | [x]
poppler/pdftohtml | 0.2G | 1.2M | 107 | office | [x] | [x] | [x]
libksba/cert-basic | 7.5G | 10.7M | 6 | crypto | [x] | [x] | 
harfbuzz/main | | | | office | | 
cjson/cjson | 90.9G | 25.6M | 4 | web | [x] | [x] | 

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
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
exit
cd /path/to/afl
```
* For each VM, run one of the following (examples):
```
./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/binutils/seed_dir -o /media/sf_hugeData/readelf -t 100 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/binutils/binutils-2.30/binutils/readelf -a @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/libjpeg/seed_dir/ -o /media/sf_hugeData/djpeg -t 100 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/libjpeg/jpeg-9c/djpeg @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/libarchive/seed_dir/ -o /media/sf_hugeData/bsdtar -t 100 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/libarchive/libarchive-3.3.2/bsdtar -O -xf @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/tcpdump/seed_dir/ -o /media/sf_hugeData/tcpdump -t 100 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/tcpdump/tcpdump-4.9.2/tcpdump -nr @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/audiofile/seed_dir/ -o /media/sf_hugeData/sfconvert -t 100 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/audiofile/audiofile-0.2.7/sfcommands/sfconvert @@ out.mp3 format aiff

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/poppler/seed_dir/ -x /home/fuzz/Desktop/fuzzing-benchmarks/poppler/pdf.dict -o /media/sf_hugeData/pdftohtml -t 100 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/poppler/poppler-0.22.5/utils/pdftohtml @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/libksba/seed_dir/ -o /media/sf_hugeData/cert-basic -t 100 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/libksba/libksba-1.3.5/tests/cert-basic @@

./afl-fuzz-saveinputs -i /home/fuzz/Desktop/fuzzing-benchmarks/cjson/seed_dir/ -o /media/sf_hugeData/cjson -x /home/fuzz/Desktop/fuzzing-benchmarks/cjson/json.dict -t 100 -e 1440 -Q -- /home/fuzz/Desktop/fuzzing-benchmarks/cjson/cjson-1.7.7/fuzzing/cjson @@
```

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
