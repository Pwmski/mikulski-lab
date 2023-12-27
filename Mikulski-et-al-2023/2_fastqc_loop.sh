#!/bin/bash

#while loop with retaining sample names:
ls *gz | cut -d _ -f 1-2 | sort | uniq | while read id; do

fastqc -f fastq -t 7 -o outputdir/fastq/FASTQC_reports/ ${id}

done
