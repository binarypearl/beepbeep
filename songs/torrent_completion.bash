#!/bin/bash
for i in {21..3500..40}
do
beep -f $i -d 20 -l 20
done
for i in {3500..21..40}
do
beep -f $i -d 20 -l 20
done
