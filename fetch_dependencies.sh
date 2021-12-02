#!/usr/bin/env bash

pipenv lock -r | sed -E "s/(^dulwich==.+$)/\1 --global-option=--pure/" > requirements.txt
pipenv run pip install --upgrade --no-binary :all: -r requirements.txt  --target crowd_anki/dist
rm requirements.txt
