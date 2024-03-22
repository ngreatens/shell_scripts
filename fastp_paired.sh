#!/bin/bash



forward_reads=$1
reverse_reads=$(echo $forward_reads | sed 's/_1.fastq/_2.fastq/g')
report=$(echo $forward_reads | sed 's/_1.fastq//1')

eval "$(conda shell.bash hook)" #intialize shell for conda environments
conda activate /project/fdwsru_fungal/Nick/conda/envs/fastp

fastp \
	--in1 $forward_reads \
	--in2 $reverse_reads \
	--out1 ${forward_reads%.*}_fastp_1.fastq \
	--out2 ${reverse_reads%.*}_fastp_2.fastq \
	--detect_adapter_for_pe \
	--cut_front \
	--cut_tail \
	--trim_poly_g \
	--dedup 4 \
	--html $report.html \
	--json $report.json
conda deactivate

## fastqc on output
ml fastqc
fastqc ${forward_reads%.*}_fastp_1.fastq ${reverse_reads%.*}_fastp_2.fastq
