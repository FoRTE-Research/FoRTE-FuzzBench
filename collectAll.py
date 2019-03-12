import sys
import subprocess
import os

basePath = os.path.dirname(os.path.realpath(__file__))

benches = []
benches.append(('bsdtar',       basePath + '/libarchive/libarchive-3.3.2'))
benches.append(('cert-basic',   basePath + '/libksba/libksba-1.3.5/tests'))
benches.append(('cjson',        basePath + '/cjson/cjson-1.7.7/fuzzing'))
benches.append(('djpeg',        basePath + '/libjpeg/jpeg-9c'))
benches.append(('pdftohtml',    basePath + '/poppler/poppler-0.22.5/utils'))
benches.append(('readelf',      basePath + '/binutils/binutils-2.30/binutils'))
benches.append(('sfconvert',    basePath + '/audiofile/audiofile-0.2.7/sfcommands'))
benches.append(('tcpdump',      basePath + '/tcpdump/tcpdump-4.9.2'))

postfix = ""
status = "Copying to "+os.getcwd()+"...\n"

usage = """
        USAGE: 
            
            Call this script from whichever directory you 
            wish the benchmarks to be deposited in:

                python /path/to/collectAll.py [postfix]

            All benchmarks will be copied and appended with 
            the specified postfix (leave blank if none).
        """
print "collectAll.py - FoRTE-fuzz-benchmarks | FoRTE-Research @ Virginia Tech\n"

if len(sys.argv) == 2:
    postfix = sys.argv[1]
    status = status = "Copying to "+os.getcwd()+" with postfix \""+postfix+"\"...\n"
if len(sys.argv) > 2:
    print "\nError : more than one postfix!"
    print usage

print status

for bench in benches:
    command = ('cp', bench[1]+'/'+bench[0], bench[0]+postfix)
    try:
        subprocess.check_call(command)
    except subprocess.CalledProcessError as e:
        print e
