#!/bin/sh

gameFile=game.wrdl

if ! [[ -f "$gameFile" ]]
then
	echo "no game file exists (must run init)"
	exit
fi

word=`bash getGameWord.sh`
length=`bash getGameLen.sh`
turn=`bash getGameTurn.sh`
guess="$1"
guessLen=`echo "$guess" | awk '{print length}'`

if ! [[ "$guessLen" == "$length" ]]
then
	echo "guess is not the correct length: $length"
	exit	
fi

guessIsWord=`bash isWord.sh "$guess"`
if ! [[ "$guessIsWord" == 1 ]]
then
	echo "guess is not a word, dummy"
	exit
fi

echo "play$turn=$guess" >> game.wrdl
bash incrTurn.sh
bash printGame.sh

if [ "$guess" = "$word" ];
then
	echo "CORRECT! YOU WIN!"
	bash endGame.sh
else
	echo "WRONG! IDIOT!"
	if [ "$turn" -ge "$length" ];
	then
		echo "You lose. Correct word was: $word"
		bash endGame.sh
	else
		echo "Try again..."
	fi
fi
