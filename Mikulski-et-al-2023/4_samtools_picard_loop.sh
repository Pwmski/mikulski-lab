#!/bin/bash

#while loop sammtools & picard
#flag & remove duplicates
ls *.sam | cut -d . -f 1 | sort | uniq \
    | while read id; do \

       samtools view -@7 -S -b ${id}.sam > ${id}.bam
	   samtools sort -@7 ${id}.bam -o outputdir/bam_sam_IP/bam_sorted/${id}_sorted.bam
	   
	   picard MarkDuplicates \
      REMOVE_DUPLICATES=true \
      INPUT=outputdir/bam_sam_IP/bam_sorted/${id}_sorted.bam \
      OUTPUT=outputdir/bam_sam_IP/bam_sorted_rmvdup/${id}_sorted_rmvdups.bam \
      METRICS_FILE=outputdir/bam_sam_IP/bam_sorted_rmvdup/${id}_sorted_rmvdups.log \
	  
	  samtools index outputdir/bam_sam_IP/bam_sorted_rmvdup/${id}_sorted_rmvdups.bam

      done
