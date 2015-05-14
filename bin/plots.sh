#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

mkdir -p plot-scotland plot-language || exit 1

scot='\<scot(\>|[^t]\>|[a-z][a-z])'

bin/in-time                 plot-scotland/scot.pdf              "$scot" 'scot...' &
bin/in-time -sex            plot-scotland/scot-sex.pdf          "$scot" 'scot...' &
bin/in-time -region         plot-scotland/scot-region.pdf       "$scot" 'scot...' &
bin/in-time -gentry         plot-scotland/scot-gentry.pdf       "$scot" 'scot...' &
bin/in-time -sex -region    plot-scotland/scot-sex-region.pdf   "$scot" 'scot...' &
bin/in-time -sex -gentry    plot-scotland/scot-sex-gentry.pdf   "$scot" 'scot...' &
bin/in-time -print  -period plot-scotland/scot-period.txt       "$scot" 'scot...' &

bin/in-time                 plot-scotland/queen.pdf             '\<queen' 'queen...' &
bin/in-time -sex            plot-scotland/queen-sex.pdf         '\<queen' 'queen...' &
bin/in-time -region         plot-scotland/queen-region.pdf      '\<queen' 'queen...' &
bin/in-time -gentry         plot-scotland/queen-gentry.pdf      '\<queen' 'queen...' &
bin/in-time -print  -sex    plot-scotland/queen-sex.txt         '\<queen' 'queen...' &

bin/in-time                 plot-scotland/union.pdf             '\<union' 'union...' &
bin/in-time -print          plot-scotland/union.txt             '\<union' 'union...' &

bin/in-time       plot-scotland/engl.pdf                '\<engl' 'engl...' &
bin/in-time       plot-scotland/brit.pdf                '\<brit' 'brit...' &
bin/in-time       plot-scotland/king.pdf                '\<king' 'king...' &
bin/in-time       plot-scotland/pretender.pdf           '\<pretender\>' 'pretender' &
bin/in-time -swap plot-scotland/protestant-catholic.pdf '\<protestant' 'protestant...' '\<catholic' 'catholic' &
bin/in-time       plot-scotland/tory-whig.pdf           '\<tory\>' 'tory...' '\<whig\>' 'whig' &
bin/in-time -swap plot-scotland/unite-america.pdf       '\<unite' 'unite...' '\<america' 'america...' &
bin/in-time -swap plot-scotland/wales-welsh.pdf         '\<wales' 'wales...' '\<welsh' 'welsh...' &
bin/in-time -swap plot-scotland/ireland-irish.pdf       '\<ireland' 'ireland...' '\<irish' 'irish...' &

bin/in-time                 plot-language/hath-has.pdf              '\<hath\>' 'hath' '\<has\>' 'has' &
bin/in-time -sex            plot-language/hath-has-sex.pdf          '\<hath\>' 'hath' '\<has\>' 'has' &
bin/in-time -region         plot-language/hath-has-region.pdf       '\<hath\>' 'hath' '\<has\>' 'has' &
bin/in-time -gentry         plot-language/hath-has-gentry.pdf       '\<hath\>' 'hath' '\<has\>' 'has' &
bin/in-time -sex -region    plot-language/hath-has-sex-region.pdf   '\<hath\>' 'hath' '\<has\>' 'has' &

bin/in-time -swap           plot-language/hospital.pdf              '\<hospital\>' 'hospital' &
bin/in-time -swap           plot-language/newspaper.pdf              '\<newspaper' 'newspaper...' &


wait
