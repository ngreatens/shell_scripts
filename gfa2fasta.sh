#!/bin/bash

for assembly in $1/*.gfa; do
	awk '/^S/{print ">"$2;print $3}' $assembly > ${assembly%.gfa}.fasta
done
