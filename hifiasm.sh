#!/bin/bash

module load hifiasm/0.18.9

hifiasm \
	-o $2 \
	-t 32 \
	$1

