#!/usr/bin/env bash
set -xe

ls -lh /dev/fd/
pipenv run ./a.sh <(echo hi) $$
# cat <(echo hi)
# echo hi | pipenv run sed 's/h/g/'
# pipenv run cat <(echo hi)
#pipenv run pip install --upgrade --no-binary :all: -r <(pipenv requirements | sed -E "s/(^dulwich==.+$)/\1 --global-option=--pure/")  --target crowd_anki/dist

# # check for linux shared object files.  this won't work on windows and might not work on macos.
# if [ ! "$(find crowd_anki/dist/ -name '*.so')" == "" ]
# then
#     echo "Found compiled .so file.  Build is not pure python!"
#     exit 1
# fi
