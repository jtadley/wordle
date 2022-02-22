#!/bin/sh

grep "turn" game.wrdl | sed -n -e 's/^.*=//p'
