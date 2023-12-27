Pipeline for Cut&Run analyses in Mikulski et al. 2023:

    Data collection (Basespace CLI) and concatenation of fastq files from separate Illumina HiSeq sequencing lanes into one
    Quality control: FASTQC analysis
    Mapping: Bowtie2 to reference genome [with trimming, local mapping and filtering out discordant/mixed/unaliged reads]
    Conversion Sam -> Bam sorted + Removal duplicates: Samtools conversion to bam, sorting and indexing. Picard removal of duplicates
    Conversion Bam -> Bigwig + Normalization (CPM): Deeptools bamCoverage scaling, counting and normalizing [currently CPM normalization, with read extension]
    Peak calling: MACS2 peak calling from bam [currently broad enrichment, relaxed cutoff, on removed duplicate files]
    Read counting: Deeptools multiBigwigSummary on bigwigfiles [with a given reference genomic region BED files]

Pawel Mikulski, PhD

