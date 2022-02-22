#!/bin/sh


gameFile=game.wrdl

if ! [[ -f "$gameFile" ]]
then
	exit
fi

word=`bash getGameWord.sh`
length=`bash getGameLen.sh`
turn=`bash getGameTurn.sh`
highlight=`bash getHighlighPrintf.sh`
smso=`tput smso | sed -n l | sed 's/.$//'`
rmso=`tput rmso | sed -n l | sed 's/.$//'`

echo ""

for row in `seq 1 "$length"`
do
	if [[ "$turn" -gt "$row" ]]
	then
		curWord=`bash getGamePlay.sh "$row"`
		for col in `seq 1 "$length"`
		do
			wordLetter=`expr substr "$word" "$col" 1`
			curWordLetter=`expr substr "$curWord" "$col" 1`
			if [ "$curWordLetter" = "$wordLetter" ];
			then
				tput smso;printf "$curWordLetter";tput rmso;
			else
				wordContainsLetter=`echo "$word" | grep "$curWordLetter"`
				if [[ -n "$wordContainsLetter" ]]
				then
					tput smul;printf "$curWordLetter";tput rmul
				else
					echo -n "$curWordLetter"
				fi
			fi
		done
		echo ""
	else
		for i in `seq 1 "$length"`
		do
			echo -n "_"
		done
		echo ""
	fi
done

echo ""
