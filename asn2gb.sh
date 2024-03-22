#!/bin/bash

eval "$(conda shell.bash hook)" #initiate shell for conda envs
conda activate /project/fdwsru_fungal/Nick/conda/envs/asn2gb

input_sequin=$1
output_genbank=$2

asn2gb -i $input_sequin -o $output_genbank

conda deactivate

