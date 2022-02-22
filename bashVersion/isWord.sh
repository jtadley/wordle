#!/bin/sh

res=`curl -sS https://api.dictionaryapi.dev/api/v2/entries/en/$1 | grep -v "No Definitions Found"`

if [[ -n "$res" ]]
then
	echo 1
else
	echo 0
fi
