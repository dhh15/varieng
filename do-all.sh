#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

log="log/log.txt"

mkdir -p plot log || exit 1
rm -f $log
in-time/in-time plot/scotl-engl.pdf '\<scotl' '\<engl' | tee -a $log
in-time/in-time plot/scotl-scotx.pdf '\<scotl' '\<scot[^l]' | tee -a $log
in-time/in-time plot/union.pdf '\<union' | tee -a $log
in-time/in-time plot/kingd.pdf '\<kingd' | tee -a $log
