#!/bin/bash

module load \
	merqury/1.3 \
	meryl/1.4 

reads=$1
pri_asm=$2
sec_asm=$3
out_meryl=$(basename $reads .fastq).meryl
out_prefix=$(basename $reads .fastq)

meryl \
	k=20 \
	count $reads \
	output $out_meryl

merqury.sh \
	$out_meryl \
	$pri_asm \
	$sec_asm \
	$out_prefix
