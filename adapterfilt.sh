#!/bin/bash

pacbioadapterfilt.sh

module load \
        blast+/2.13.0 \
        bamtools/2.5.2

export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/HiFiAdapterFilt
export PATH=$PATH:/project/fdwsru_fungal/Nick/git_repos/HiFiAdapterFilt/DB

cd $1
bash pbadapterfilt.sh
cd ..

gunzip $1/*.gz


