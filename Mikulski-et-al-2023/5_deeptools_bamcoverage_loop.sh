#!/bin/bash

#while loop - read counts & normalization with deeptools bamcoverage
#remove duplicate bam sorted file as input; bin size 25bp; CPM normalization
ls *rmvdups.bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

      bamCoverage --bam ${id}_sorted_rmvdups.bam -o outputdir/deeptools_bamcoverage/bigwig_rmvdups/${id}_rmvdups.bw \
    --scaleFactor 1 \
    --binSize 25 \
   --normalizeUsing CPM \
    --effectiveGenomeSize 2913022398 \
    --ignoreForNormalization chrX \
    --extendReads \
    --numberOfProcessors=7 \

      done
