#!/bin/bash

module load \
        miniconda/4.12.0

eval "$(conda shell.bash hook)" #intialize shell for conda environments

conda activate /project/fdwsru_fungal/Nick/conda/envs/my_NanoPlot

NanoPlot \
        --threads 32 \
        --outdir $1 \
        --fastq $2
