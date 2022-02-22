#!/bin/sh

wordsFName=words.tmp
tmpWordsFName=tmpWords.tmp
quitVar=0
length=$1

curl -sS https://random-word-api.herokuapp.com/word?number=100 | grep -o '".*"' | sed 's/"//g' | sed 's/,/\n/g' > "$wordsFName"

while [[ "$quitVar" == 0 ]]
do
	word=`head -n 1 "$wordsFName"`

	if [[ -v "$word" ]]
	then
		echo "failed to get a word"
		quitVar=1
	fi

	cp "$wordsFName" "$tmpWordsFName" && tail -n +2 "$tmpWordsFName" > "$wordsFName"

	curLen=`echo "$word" | awk '{print length}'`

	if [[ "$curLen" == "$length" ]]
	then
		isWord=`./isWord.sh "$word"`
		if [[ "$isWord" == 1 ]]
		then
			quitVar=1
		fi
	fi
done

echo "$word"
