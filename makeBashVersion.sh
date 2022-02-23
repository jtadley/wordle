#!/bin/sh

dirName="bashVersion0"

rm -rf "$dirName"
mkdir "$dirName"

cp *.txt "$dirName"
# cat *.sh | sed  >> "$dirName"
