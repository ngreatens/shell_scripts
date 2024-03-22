#!/bin/bash

module load cutadapt/4.0

forward=$1
reverse=$(echo $forward | sed 's/1.fastq/2.fastq/1')

export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/TrimGalore

trim_galore \
	--paired \
	$forward \
	$reverse
