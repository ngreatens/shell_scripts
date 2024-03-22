#!/bin/bash

forward_reads=$1 
reverse_reads=$(echo $forward_reads | sed 's/1.fastq/2.fastq/1')
module load cutadapt fastqc

export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/bin

trim_galore \
	--quality 20 \
	--fastqc \
	--paired $forward_reads $reverse_reads 
