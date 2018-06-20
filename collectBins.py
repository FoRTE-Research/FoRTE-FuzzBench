import sys
import subprocess

basePath = '/home/mdhicks2/Desktop/fuzzing-benchmarks'
INPUT_DIV = 24

benches = []

benches.append(('readelf', basePath + '/binutils/binutils-2.30/binutils', '-a @@', 15347747))

benches.append(('djpeg', basePath + '/libjpeg/jpeg-9c', '@@', 2539657))

benches.append(('bsdtar', basePath + '/libarchive/libarchive-3.3.2', '-O -xf @@', 17027519))

benches.append(('tcpdump', basePath + '/tcpdump/tcpdump-4.9.2', '-nr @@', 27718903))

benches.append(('sfconvert', basePath + '/audiofile/audiofile-0.2.7/sfcommands', '@@ out.mp3 format aiff', 8265403))

benches.append(('pdftohtml', basePath + '/poppler/poppler-0.22.5/utils', '@@', 1290406))

benches.append(('cert-basic', basePath + '/libksba/libksba-1.3.5/tests', '@@', 14253400))

benches.append(('cjson', basePath + '/cjson/cjson-1.7.7/fuzzing', '@@', 26932046))


postfix = 'Original'
if len(sys.argv) == 2:
    if sys.argv[1] == '-p':
        for bench in benches:
            print 'export FSF_BENCH=' + bench[0]
            print 'export FSF_BENCH_ARGS=' + bench[2]
            print 'export FSF_NUM_INPUTS=' + str(bench[3]/INPUT_DIV)
        exit(0)
    if sys.argv[1] == '-w':
        postfix = 'WB'
else:
    print 'Usage:'
    print '\t-b: collect baseline binaries'
    print '\t-w: collect afl-llvm binaries'
    print '\t-p: print eval environmental vars'
    exit(0)
    
for bench in benches:
    command = ('cp', bench[1] + '/' + bench[0], bench[0] + postfix)
    print command
    subprocess.Popen(command)
