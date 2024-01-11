#!/bin/bash

export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/Filtlong/bin

filtlong \
        --min_mean_q 99.9 `#keep mean q30 or greater, or 99.9% correct` \
        $1 `#input fastq`\
        > $2 `#output fastq`
