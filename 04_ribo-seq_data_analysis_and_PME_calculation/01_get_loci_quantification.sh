zcat ribo_c72_1-0_rep1.clean.fq.gz | bowtie --chunkmbs 1000 -p 4 --un ribo_c72_1-0_rep1.rm_rDNA.fastq maize_bowtie_index_rDNA - 

tophat --bowtie1 -N 1 -I 50000 -p 6 -o ribo_c72_1-0_rep1 C7-2.v1.bt1 ribo_c72_1-0_rep1.rm_rDNA.fastq 

samtools view -q 20 -b ribo_c72_1-0_rep1 | samtools sort -o ribo_c72_1-0_rep1.q20.sorted.bam -

cufflinks -p 2 -o ribo_c72_1-0_rep1.cufflinks-2 -u -G all.collapsed.rep.gff ribo_c72_1-0_rep1.q20.sorted.bam 
