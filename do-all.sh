#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

mkdir -p plot || exit 1
bin/in-time plot/scotl-engl.pdf '\<scotl' '\<engl' &
bin/in-time plot/scotl-scotx.pdf '\<scotl' '\<scot[^l]' &
bin/in-time plot/union.pdf '\<union' &
bin/in-time plot/kingd.pdf '\<kingd' &
bin/in-time plot/brit.pdf '\<brit' &
bin/in-time plot/pretender.pdf '\<pretender\>' &
bin/in-time -sex -region plot/scotl-engl-sex-region.pdf '\<scotl' '\<engl' &
bin/in-time -sex -region plot/union-sex-region.pdf '\<union' &
wait
