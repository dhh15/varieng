#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

mkdir -p plot || exit 1
in-time/in-time plot/scotl-engl.pdf '\<scotl' '\<engl' &
in-time/in-time plot/scotl-scotx.pdf '\<scotl' '\<scot[^l]' &
in-time/in-time plot/union.pdf '\<union' &
in-time/in-time plot/kingd.pdf '\<kingd' &
in-time/in-time plot/brit.pdf '\<brit' &
in-time/in-time plot/pretender.pdf '\<pretender\>' &
in-time/in-time -sex -region plot/scotl-engl-sex-region.pdf '\<scotl' '\<engl' &
in-time/in-time -sex -region plot/union-sex-region.pdf '\<union' &
wait
