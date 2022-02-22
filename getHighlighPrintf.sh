#!/bin/sh

pre=`tput smso | sed -n l | sed 's/.$//'`
post=`tput rmso | sed -n l | sed 's/.$//'`

echo "$pre$post"
