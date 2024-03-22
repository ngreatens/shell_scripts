#!/bin/bash

ml fastqc

forward_reads=$1
reverse_reads=$(echo $forward_reads | sed 's/_1./_2./1')


fastqc $forward_reads $reverse_reads
