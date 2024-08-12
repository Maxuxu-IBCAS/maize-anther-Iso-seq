# mapping
hisat2 -p 4 --dta -x ZM1-1D.fasta.hisat2 -U 1_maize-A15_30_1-nanoCAGE_clean.fq.gz | samtools view -bS - >1_maize-A15_30_1-nanoCAGE_clean.fq.gz.sam
hisat2 -p 4 --dta -x ZM1-1D.fasta.hisat2 -U 1_maize-A15_30_2-nanoCAGE_clean.fq.gz | samtools view -bS - >1_maize-A15_30_2-nanoCAGE_clean.fq.gz.sam

# sort
samtools view -h -q 20 1_maize-A15_30_1-nanoCAGE_clean.fq.gz.sam | samtools sort -o 1_maize-A15_30_1-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam - &
samtools view -h -q 20 1_maize-A15_30_2-nanoCAGE_clean.fq.gz.sam | samtools sort -o 1_maize-A15_30_2-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam -

#
bedtools bamtobed -i 1_maize-A15_30_1-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam >1_maize-A15_30_1-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam.bed &
bedtools bamtobed -i 1_maize-A15_30_2-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam >1_maize-A15_30_2-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam.bed &

#
perl 01_get_TSS.pl 1_maize-A15_30_1-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam.bed >1_maize-A15_30_1-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam.bed.ctss &
perl 01_get_TSS.pl 1_maize-A15_30_2-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam.bed >1_maize-A15_30_2-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam.bed.ctss 

#
perl combine_replication.pl 1_maize-A15_30_1-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam.bed.ctss 1_maize-A15_30_2-nanoCAGE_clean.fq.gz.sam.q20.sorted.bam.bed.ctss >maize-A15_30.ctss
