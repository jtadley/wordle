#!/bin/sh

grep "length" game.wrdl | sed -n -e 's/^.*=//p'
