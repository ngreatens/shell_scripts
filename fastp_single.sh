#!/bin/bash

####Usage####
###cd into dir when calling ing script


forward_reads=$1
report=$(echo $forward_reads | sed 's/.fastq//1')

eval "$(conda shell.bash hook)" #intialize shell for conda environments
conda activate /project/fdwsru_fungal/Nick/conda/envs/fastp

fastp \
	--in1 $forward_reads \
	--out1 ${forward_reads%.*}_fastp.fastq \
	--cut_front \
	--cut_tail \
	--trim_poly_g \
	--dedup 4 \
	--html $report.html \
	--json $report.json 

conda deactivate


#fastqc on output
ml fastqc
fastqc ${forward_reads%.*}_fastp.fastq 
