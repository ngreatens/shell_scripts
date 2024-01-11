#!/bin/bash

module load samtools

samtools bam2fq $1 > $2


