#!/bin/bash

#authenticate basespace cli (https://developer.basespace.illumina.com/docs/content/documentation/cli/cli-overview)
bs auth
#list all available projects in your basespace account (can do the same for datasets or runs)
bs list projects
#download project files, fastq.gz only, to outputdir (select project ID (XXX) from previous command)
bs download project -i XXX -o  outputdir/fastq --extension=fastq.gz

#change folder and subfolder permissions if needed
chmod 777 -R xxx.dir

# list all files' names containing R1 (so also R2)-> separate by "_"-> extract first field (id) after separation-> sort and remove redudant fields-> while loop to concatenate fastq.gz per id 
ls *R1_* | cut -d _ -f 1 | sort | uniq \
    | while read id; do \
        cat $id*R1*.fastq.gz > ${id}_r1.fastq.gz;
        cat $id*R2*.fastq.gz > ${id}_r2.fastq.gz;
      done
