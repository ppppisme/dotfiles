#!/usr/bin/sh

build=$(pwd)
mkdir otb

for i in "$build"/genbdf/*.bdf; do
  fonttosfnt -v -o "$build/otb/$(basename "$i" .bdf).otb" "$i"
done
