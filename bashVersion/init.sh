#!/bin/sh


gameFile=game.wrdl
length=$1

if [[ -z "$length" ]]
then
	echo "input word length is required"
	exit
fi

word=`bash getWord.sh "$length"`

if [[ -n "$word" ]]
then
	printf "%s\n" "length=$1" "word=$word" "turn=1" > "$gameFile"
	echo 1
else
	echo 0
fi
