Pipeline for Cut&Run-seq analyses in Mikulski et al. 2023:

    1. Data collection (Basespace CLI) and concatenation of fastq files from separate Illumina HiSeq sequencing lanes into one
    2. Quality control: FASTQC analysis
    3. Mapping: Bowtie2 to reference genome [with trimming, local mapping and filtering out discordant/mixed/unaliged reads]
    4. Conversion Sam -> Bam sorted + Removal duplicates: Samtools conversion to bam, sorting and indexing. Picard removal of duplicates
    5. Conversion Bam -> Bigwig + Normalization (CPM): Deeptools bamCoverage scaling, counting and normalizing [currently CPM normalization, with read extension]
    6. Peak calling: MACS2 peak calling from bam [currently broad enrichment, relaxed cutoff, on removed duplicate files]
    7. Read counting: Deeptools multiBigwigSummary on bigwigfiles [with a given reference genomic region BED files]

Pawel Mikulski, PhD

