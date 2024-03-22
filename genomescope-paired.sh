#!/bin/bash
module load \
	jellyfish2/2.2.9 \
	r/4.3.1

forward_reads=$1
reverse_reads=$(echo $forward_reads | sed 's/1.fastq/2.fastq/1')
outname=$(echo $forward_reads | sed 's/_1.fastq//1')
kmer_length=21
read_length=150 #adjust depending on read length
memory=1000000000

export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/genomescope

mkdir $outname

cat $forward_reads >${outname}/concat.reads.txt
cat $reverse_reads >>${outname}/concat.reads.txt

jellyfish count \
	-C `#recommended usage for raw reads where orientation of the reads is unknown. reduces compute time. see manual`\
	-m $kmer_length \
	-s $memory \
	-t 10 `#threads` \
	${outname}/concat.reads.txt \
	-o ${outname}.jf 

rm ${outname}/concat.reads.txt
rmdir ${outname}

jellyfish histo ${outname}.jf > ${outname}.jf.histo

#call Rscript to produce plots with genomescope
genomescope.R ${outname}.jf.histo $kmer_length $read_length ${outname}_genomescope

#rename plots
for file in ${outname}_genomescope/*; do mv $file ${outname}_genomescope/${outname}_genomescope_$(basename $file); done
