#!/bin/bash

reads=$1 

module load cutadapt fastqc

export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/bin

trim_galore \
	--quality 20 \
	--fastqc \
	$reads 
