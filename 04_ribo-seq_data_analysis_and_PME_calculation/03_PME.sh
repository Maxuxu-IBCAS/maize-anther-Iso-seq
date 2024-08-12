#locus_position.bed: bed format file of target gene 


samtools view -b -L locus_position.bed ribo_c72_1-0_rep1.q20.sorted.bam | bedtools bamtobed -i - >ribo_c72_1-0_rep1.q20.sorted.bam.bed &

perl convert_format_for_PME.pl ribo_c72_1-0_rep1.q20.sorted.bam.bed locus_position.bed >ribo_c72_1-0_rep1.q20.sorted.bam.bed.PME.txt

perl calculate_PME.pl ribo_c72_1-0_rep1.q20.sorted.bam.bed.PME.txt >ribo_c72_1-0_rep1.q20.sorted.bam.bed.PME.txt.pme
