#!/bin/bash

ml fastqc

forward_reads=$1

fastqc $forward_reads 
