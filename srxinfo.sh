#!/bin/bash

esearch -db sra -query $1 | efetch -format runinfo

