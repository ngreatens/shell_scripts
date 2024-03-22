#!/bin/bash

ID=$1

module load sratoolkit

prefetch $ID
cd $ID
for file in *.sra; do
	fasterq-dump --split-files $file
done 
cd ..
