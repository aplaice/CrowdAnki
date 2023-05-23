#!/usr/bin/env bash

ls -lh /proc/$2/fd/
ls -lh /dev/fd/
sed 's/h/g/' $1
