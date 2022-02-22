#!/bin/sh

gameFile=game.wrdl

if ! [[ -f "$gameFile" ]]
then
	echo "no game file exists (must run init)"
	exit
fi

word=`./getGameWord.sh`
length=`./getGameLen.sh`
turn=`./getGameTurn.sh`
guess="$1"
guessLen=`echo "$guess" | awk '{print length}'`

if ! [[ "$guessLen" == "$length" ]]
then
	echo "guess is not the correct length: $length"
	exit	
fi

echo "play$turn=$guess" >> game.wrdl
./incrTurn.sh
./printGame.sh

if [[ "$guess" = "$word" ]]
then
	echo "CORRECT! YOU WIN!"
	./endGame.sh
else
	echo "WRONG! IDIOT!"
	if [ "$turn" -ge "$length" ];
	then
		echo "You lose. Correct word was: $word"
		./endGame.sh
	else
		echo "Try again..."
	fi
fi
