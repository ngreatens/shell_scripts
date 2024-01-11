#!/bin/bash


export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/seqtk

seqtk seq -C \
	$1 `#input fastq` \
	> $2  `#output.fastq`
