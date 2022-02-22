#!/bin/sh

grep "word" game.wrdl | sed -n -e 's/^.*=//p'
