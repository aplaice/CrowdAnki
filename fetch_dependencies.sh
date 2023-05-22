#!/usr/bin/env bash
set -xe

cat <(echo hi)
pip install --upgrade --no-binary :all: -r <(echo dulwich)  --target crowd_anki/dist

# Check for Linux shared object files.  This won't work on Windows and might not work on MacOS.
if [ ! "$(find crowd_anki/dist/ -name '*.so')" == "" ]
then
    echo "Found compiled .so file.  Build is not pure python!"
    exit 1
fi
