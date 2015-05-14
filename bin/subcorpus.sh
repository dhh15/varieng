#!/bin/bash

file="plot-scotland/scot-period.txt"
for period in 1700-1719 1720-1739; do
    dir="output/scot-$period"
    echo "$dir"
    mkdir -p "$dir" || exit 1
    for a in $(egrep "^$period"$"\t" "$file" | cut -f5); do
        cp "output/semicleaned-data/$a.txt" "$dir/" || exit 1
    done
done
