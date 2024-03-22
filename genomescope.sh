#!/bin/bash
module load \
	jellyfish2/2.2.9 \
	r/4.3.1

input_fastq=$1
outname=$(basename $input_fastq .fastq)
kmer_length=21
read_length=100 #adjust depending on read length
memory=1000000000 #approx genome size

jellyfish count \
	-C `#recommended usage for raw reads where orientation of the reads is unknown. reduces compute time. see manual`\
	-m $kmer_length \
	-s $memory \
	-t 10 `#threads` \
	$input_fastq \
	-o ${outname}.jf 

jellyfish histo ${outname}.jf > ${outname}.jf.histo

#call Rscript to produce plots with genomescope
/project/fdwsru_fungal/Nick/git_repos/genomescope/genomescope.R ${outname}.jf.histo $kmer_length $read_length ${outname}_genomescope

#rename plots 
for file in ${outname}_genomescope/*; do mv $file ${outname}_genomescope/${outname}_genomescope_$(basename $file); done
