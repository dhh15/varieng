#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

mkdir -p plot-scotland plot-language || exit 1

scot='\<scot(\>|[^t]\>|[a-z][a-z])'

bin/in-time                 plot-scotland/scot.pdf              "$scot" &
bin/in-time -sex            plot-scotland/scot-sex.pdf          "$scot" &
bin/in-time -region         plot-scotland/scot-region.pdf       "$scot" &
bin/in-time -gentry         plot-scotland/scot-gentry.pdf       "$scot" &
bin/in-time -sex -region    plot-scotland/scot-sex-region.pdf   "$scot" &
bin/in-time -sex -gentry    plot-scotland/scot-sex-gentry.pdf   "$scot" &
bin/in-time -print  -period plot-scotland/scot-period.txt       "$scot" &

bin/in-time                 plot-scotland/queen.pdf             '\<queen' &
bin/in-time -sex            plot-scotland/queen-sex.pdf         '\<queen' &
bin/in-time -region         plot-scotland/queen-region.pdf      '\<queen' &
bin/in-time -gentry         plot-scotland/queen-gentry.pdf      '\<queen' &
bin/in-time -print  -sex    plot-scotland/queen-sex.txt         '\<queen' &

bin/in-time                 plot-scotland/union.pdf             '\<union' &
bin/in-time -print          plot-scotland/union.txt             '\<union' &

bin/in-time                 plot-scotland/engl.pdf              '\<engl' &
bin/in-time                 plot-scotland/brit.pdf              '\<brit' &
bin/in-time                 plot-scotland/king.pdf              '\<king' &
bin/in-time                 plot-scotland/pretender.pdf         '\<pretender\>' &

bin/in-time                 plot-language/hath-has.pdf              '\<hath\>' '\<has\>' &
bin/in-time -sex            plot-language/hath-has-sex.pdf          '\<hath\>' '\<has\>' &
bin/in-time -region         plot-language/hath-has-region.pdf       '\<hath\>' '\<has\>' &
bin/in-time -gentry         plot-language/hath-has-gentry.pdf       '\<hath\>' '\<has\>' &
bin/in-time -sex -region    plot-language/hath-has-sex-region.pdf   '\<hath\>' '\<has\>' &

wait
