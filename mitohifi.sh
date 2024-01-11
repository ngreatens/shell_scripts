#!/bin/bash

module load \
	apptainer/1.2.2

reads=$1
target_fasta=$2
target_gbk=$3

apptainer exec /project/fdwsru_fungal/Nick/sifs/mitohifi_master.sif mitohifi.py \
        -r $reads \
        -f $target_fasta `#close-related mitogenome in fasta format` \
        -g $target_gbk `#close-related mitogenome in gbk format` \
        -t 32 `#threads` \
        -a fungi `#choose between animal, plant, fungi`
