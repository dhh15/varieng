#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

mkdir -p plot || exit 1
in-time/in-time plot/scotl-engl.pdf '\<scotl' '\<engl' || exit 1
in-time/in-time plot/scotl-scotx.pdf '\<scotl' '\<scot[^l]' || exit 1
