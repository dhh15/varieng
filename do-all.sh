#!/bin/sh

# Assumption:
# ../dhh15 = input data from https://bitbucket.org/suomela/dhh15

rm -rf data output plot-*
ln -s ../dhh15 data

bin/preprocess.sh || exit 1
bin/plots.sh || exit 1
