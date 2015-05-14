#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

mkdir -p plot-scotland plot-language || exit 1

bin/in-time -print -sex plot-scotland/queen-sex.txt '\<queen' &

bin/in-time plot-scotland/scot.pdf '\<scot' &
bin/in-time -sex plot-scotland/scot-sex.pdf '\<scot' &
bin/in-time -region plot-scotland/scot-region.pdf '\<scot' &
bin/in-time -gentry plot-scotland/scot-gentry.pdf '\<scot' &
bin/in-time -sex -region plot-scotland/scot-sex-region.pdf '\<scot' &

bin/in-time plot-scotland/scotl-engl.pdf '\<scotl' '\<engl' &
bin/in-time -sex plot-scotland/scotl-engl-sex.pdf '\<scotl' '\<engl' &
bin/in-time -region plot-scotland/scotl-engl-region.pdf '\<scotl' '\<engl' &
bin/in-time -gentry plot-scotland/scotl-engl-gentry.pdf '\<scotl' '\<engl' &

bin/in-time plot-scotland/scotl-scotx.pdf '\<scotl' '\<scot[^l]' &

bin/in-time plot-scotland/union.pdf '\<union' &
bin/in-time -sex plot-scotland/union-sex.pdf '\<union' &
bin/in-time -region plot-scotland/union-region.pdf '\<union' &
bin/in-time -gentry plot-scotland/union-gentry.pdf '\<union' &

bin/in-time plot-scotland/kingd.pdf '\<kingd' &

bin/in-time plot-scotland/brit.pdf '\<brit' &

bin/in-time plot-scotland/pretender.pdf '\<pretender\>' &

bin/in-time plot-scotland/king-queen.pdf '\<king' '\<queen' &
bin/in-time -sex plot-scotland/king-queen-sex.pdf '\<king' '\<queen' &
bin/in-time -region plot-scotland/king-queen-region.pdf '\<king' '\<queen' &
bin/in-time -gentry plot-scotland/king-queen-gentry.pdf '\<king' '\<queen' &

bin/in-time plot-language/hath-has.pdf '\<hath\>' '\<has\>' &
bin/in-time -sex plot-language/hath-has-sex.pdf '\<hath\>' '\<has\>' &
bin/in-time -region plot-language/hath-has-region.pdf '\<hath\>' '\<has\>' &
bin/in-time -gentry plot-language/hath-has-gentry.pdf '\<hath\>' '\<has\>' &
bin/in-time -sex -region plot-language/hath-has-sex-region.pdf '\<hath\>' '\<has\>' &

wait
