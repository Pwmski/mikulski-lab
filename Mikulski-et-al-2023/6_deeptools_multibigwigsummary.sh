#!/bin/bash

#multibigwig summary - deeptools
# BED reference; output tab and npz; keep sample labels
multiBigwigSummary BED-file --BED reference.bed --bwfiles outputdir/deeptools_bamcoverage/bigwig_rmvdups/*.bw --numberOfProcessors max --smartLabels --verbose --outFileName outputdir/deeptools_multibigwigsumm/multibw.npz --outRawCounts outputdir/deeptools_multibigwigsumm/multibw.tab
