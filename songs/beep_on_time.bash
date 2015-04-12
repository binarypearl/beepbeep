#!/bin/sh
beep -D 500 -l 500 -r `date +%I` -f 440 -n -D 1000 -l 0 -n -D 800 -l 200 -f 880 -r `echo $(($(date +%M)/15))`
