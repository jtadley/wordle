#!/bin/sh

grep "play$1" game.wrdl | sed -n -e 's/^.*=//p'
