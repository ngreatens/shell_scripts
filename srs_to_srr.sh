#!/bin/bash

list_of_srs_files=$1

declare -a  files=()
while read line; do 
	files+=($line)
done<$1

for file in ${files[@]}; do
	esearch -db sra -query $file | efetch -format runinfo | cut -f1 -d "," | tail -1
done
