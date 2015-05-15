#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

mkdir -p plot-scotland plot-language || exit 1

scot='\bscot(\b|[^t]\b|[a-z][a-z])'

bin/in-time                 plot-scotland/scot.pdf              "$scot" 'scot...' &
bin/in-time -sex            plot-scotland/scot-sex.pdf          "$scot" 'scot...' &
bin/in-time -region         plot-scotland/scot-region.pdf       "$scot" 'scot...' &
bin/in-time -gentry         plot-scotland/scot-gentry.pdf       "$scot" 'scot...' &
bin/in-time -sex -region    plot-scotland/scot-sex-region.pdf   "$scot" 'scot...' &
bin/in-time -sex -gentry    plot-scotland/scot-sex-gentry.pdf   "$scot" 'scot...' &
bin/in-time -print  -period plot-scotland/scot-period.txt       "$scot" 'scot...' &

bin/in-time                 plot-scotland/queen.pdf             '\bqueen' 'queen...' &
bin/in-time -sex            plot-scotland/queen-sex.pdf         '\bqueen' 'queen...' &
bin/in-time -region         plot-scotland/queen-region.pdf      '\bqueen' 'queen...' &
bin/in-time -gentry         plot-scotland/queen-gentry.pdf      '\bqueen' 'queen...' &
bin/in-time -print  -sex    plot-scotland/queen-sex.txt         '\bqueen' 'queen...' &

bin/in-time                 plot-scotland/union.pdf             '\bunion' 'union...' &
bin/in-time -print          plot-scotland/union.txt             '\bunion' 'union...' &

bin/in-time       plot-scotland/engl.pdf                '\bengl' 'engl...' &
bin/in-time       plot-scotland/brit.pdf                '\bbrit' 'brit...' &
bin/in-time       plot-scotland/king.pdf                '\bking' 'king...' &
bin/in-time       plot-scotland/pretender.pdf           '\bpretender\b' 'pretender' &
bin/in-time -swap plot-scotland/protestant-catholic.pdf '\bprotestant' 'protestant...' '\bcatholic' 'catholic' &
bin/in-time       plot-scotland/tory-whig.pdf           '\btory\b' 'tory...' '\bwhig\b' 'whig' &
bin/in-time -swap plot-scotland/unite-america.pdf       '\bunite' 'unite...' '\bamerica' 'america...' &
bin/in-time -swap plot-scotland/wales-welsh.pdf         '\bwales' 'wales...' '\bwelsh' 'welsh...' &
bin/in-time -swap plot-scotland/ireland-irish.pdf       '\bireland' 'ireland...' '\birish' 'irish...' &

bin/in-time                 plot-language/hath-has.pdf              '\bhath\b' 'hath' '\bhas\b' 'has' &
bin/in-time -sex            plot-language/hath-has-sex.pdf          '\bhath\b' 'hath' '\bhas\b' 'has' &
bin/in-time -region         plot-language/hath-has-region.pdf       '\bhath\b' 'hath' '\bhas\b' 'has' &
bin/in-time -gentry         plot-language/hath-has-gentry.pdf       '\bhath\b' 'hath' '\bhas\b' 'has' &
bin/in-time -sex -region    plot-language/hath-has-sex-region.pdf   '\bhath\b' 'hath' '\bhas\b' 'has' &

bin/in-time -swap plot-language/hospital.pdf  '\bhospital\b' 'hospital' &
bin/in-time -swap plot-language/newspaper.pdf '\bnewspaper' 'newspaper...' '\bnews\W+paper' 'news paper...' &


wait
