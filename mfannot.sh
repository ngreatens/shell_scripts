#!/bin/bash

module load \
        apptainer/1.2.2

mitogenome=$1

apptainer exec /project/fdwsru_fungal/Nick/sifs/mfannot_latest.sif \
\
mfannot\
        --genetic 4 `#mitochondrial translation code. TGA = W` \
        --sqn \
        $mitogenome

