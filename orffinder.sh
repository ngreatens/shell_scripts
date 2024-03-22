#!/bin/bash

input_fasta=$1

eval "$(conda shell.bash hook)" #intialize shell for conda environments
conda activate orffinder

ORFfinder \
	-in $input_fasta \
	-g 4 `#mitochondrial genetic code` \
	-c t `#Boolean. Is the sequence circular?` \
	-out ${input_fasta%.*}_orffinder.out \
	-outfmt 2 `#out format. 2 = asn1`

conda deactivate
