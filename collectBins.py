import sys
import subprocess

basePath = '/home/mdhicks2/Desktop/fuzzing-benchmarks'

benches = []

benches.append(('readelf', basePath + '/binutils/binutils-2.30/binutils', '-a @@'))

benches.append(('djpeg', basePath + '/libjpeg/jpeg-9c', '@@'))

benches.append(('bsdtar', basePath + '/libarchive/libarchive-3.3.2', '-O -xf @@'))

benches.append(('tcpdump', basePath + '/tcpdump/tcpdump-4.9.2', '-nr @@'))

benches.append(('sfconvert', basePath + '/audiofile/audiofile-0.2.7/sfcommands', '@@ out.mp3 format aiff'))

benches.append(('pdftohtml', basePath + '/poppler/poppler-0.22.5/utils', '@@'))

benches.append(('cert-basic', basePath + '/libksba/libksba-1.3.5/tests', '@@'))

benches.append(('cjson', basePath + '/cjson/cjson-1.7.7/fuzzing', '@@'))


postfix = 'Original'
if len(sys.argv) == 2 and sys.argv[1] == '-q':
    postfix = 'WB'
    
for bench in benches:
    command = ('cp', bench[1] + '/' + bench[0], bench[0] + postfix)
    print command
    subprocess.Popen(command)
