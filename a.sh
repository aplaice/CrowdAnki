#!/usr/bin/env bash
set -xe

ls -lh /proc/$2/fd/
sleep 1
ls -lh /dev/fd/
sed 's/h/g/' $1
