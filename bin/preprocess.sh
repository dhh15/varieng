#!/bin/sh

mkdir -p output/semicleaned-data || exit 1
R CMD BATCH R/export-semiclean-ceec.R || exit 1

