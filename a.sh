#!/usr/bin/env bash
set -xe

echo "fetch_dependencies: $2"
ls -lh /proc/$2/fd/
sleep 1
echo "Parent: $PPID"
ls -lh /proc/$PPID/fd
sleep 1
echo "Me: $$"
ls -lh /dev/fd/
sleep 1
pstree -aps $$
sleep 1
which pipenv

sleep 1
sed 's/h/g/' $1
