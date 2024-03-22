#!/bin/bash

if [ $# -ne 1 ] ; then
   echo -e "usage: $(basename "$0") <unique_prefix_for_summary_files>"
   echo ""
   exit 0
fi

prefix=$1

echo -n "Sample," > genomescope_summary.csv
echo -n "Heterozygosity-min,Heterozygosity-max," >> genomescope_summary.csv
echo -n "Genome_Haploid_Length-min,Genome_Haploid_Length-max," >> genomescope_summary.csv
echo -n "Genome_Unique_Length-min,Genome_Unique_Length-max," >> genomescope_summary.csv
echo -n "Model_Fit-min,Model_Fit-max," >> genomescope_summary.csv
echo "Read_Error_Rate-min,Read_Error_Rate-max" >> genomescope_summary.csv


#make genomescope output more easily parsable. See below
for folder in */; do 
    for file in $folder/*summary.txt; do
        cat $file |
        sed -n '4,10p;10q' |
        sed 's/,//g' |
        sed 's/ \+ /,/g' |
        tr " " "_" > ${file%.txt}_parsed.txt
    done
done

for folder in */; do 
    for file in ${folder}*parsed.txt; do
        echo -n "" > tmp_out
        echo $folder | sed 's/_genomescope//g' >>tmp_out
        for row in {2..6}; do
            for col in {2..3}; do 
                cat $file |
                head -n $row | tail -1 |
                cut -d , -f $col >> tmp_out
            done
        done 
        while read line; do
            echo -n "${line}," >> genomescope_summary.csv
        done < tmp_out
        echo "" >> genomescope_summary.csv
    done
done
rm tmp_out

mkdir plots
for folder in *genomescope/; do
    for png in ${folder}*plot.png; do
        cp $png plots
    done
done

mv genomescope_summary.csv ${prefix}_genomescope_summary.csv
mv plots ${prefix}_genomescope_plots
