#!/bin/bash

module load \
	busco5/5.4.5

busco \
	-f `#force if run or busco dir already present` \
	--out $2 \
	--mode genome \
	--lineage_dataset fungi_odb10 \
	--in $1
