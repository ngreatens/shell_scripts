#!/bin/bash

export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/gfastats/build/bin

for assembly in $1/*ctg.gfa; do
	gfastats $assembly --discover-paths > $2/$(basename $assembly .ctg.gfa)_gfastats.txt
done

