#!/bin/bash

fwd=$1
rev=$2
adapter=$3

module load cutadapt 

cutadapt \
	-a $adapter \
	-A $adapter \
	-o ${fwd%*.}_trimmed_1.fastq \
	-p ${rev%*.}_trimmed_2.fastq \
	$fwd $rev


