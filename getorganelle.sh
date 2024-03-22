#!/bin/bash

forward_reads=$1
reverse_reads=$2
kmer=$3
outdir=$4

eval "$(conda shell.bash hook)" #initiate shell for conda envs
conda activate /project/fdwsru_fungal/Nick/conda/envs/getorganelle

get_organelle_from_reads.py \
        -1 $forward_reads \
        -2 $reverse_reads \
        -k $kmer \
        -F fungus_mt \
        --config-dir /project/fdwsru_fungal/Nick/databases/GetOrganelle \
        -o $outdir

