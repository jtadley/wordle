#!/bin/sh

gameFile=game.wrdl
tmpGameFile=tmpGame.wrld

turn=`bash getGameTurn.sh`

newTurn=`expr "$turn" + 1`

cp "$gameFile" "$tmpGameFile" 
grep -v "turn" "$tmpGameFile" > "$gameFile"
echo "turn=$newTurn" >> "$gameFile"
