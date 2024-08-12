#
hisat2 -p 4 --dta -x /mnt/maxuxu/data/genome/maize_chang7-2_T2T/ZM1-1D.fasta.hisat2 -U 2_maize-A15_30_1-PAS_all_clean.fq.gz.3E.fq | samtools view -bS - >2_maize-A15_30_1-PAS_all_clean.fq.gz.3E.fq.sam &
hisat2 -p 4 --dta -x /mnt/maxuxu/data/genome/maize_chang7-2_T2T/ZM1-1D.fasta.hisat2 -U 2_maize-A15_30_1-PAS_all_clean.fq.gz.5E.fq | samtools view -bS - >2_maize-A15_30_1-PAS_all_clean.fq.gz.5E.fq.sam &
hisat2 -p 4 --dta -x /mnt/maxuxu/data/genome/maize_chang7-2_T2T/ZM1-1D.fasta.hisat2 -U 2_maize-A15_30_1-PAS_all_clean.fq.gz.T.3E.fq | samtools view -bS - >2_maize-A15_30_1-PAS_all_clean.fq.gz.T.3E.fq.sam &
hisat2 -p 4 --dta -x /mnt/maxuxu/data/genome/maize_chang7-2_T2T/ZM1-1D.fasta.hisat2 -U 2_maize-A15_30_1-PAS_all_clean.fq.gz.T.5E.fq | samtools view -bS - >2_maize-A15_30_1-PAS_all_clean.fq.gz.T.5E.fq.sam

#
samtools view -h -q 20 2_maize-A15_30_1-PAS_all_clean.fq.gz.3E.fq.sam | samtools sort -o 2_maize-A15_30_1-PAS_all_clean.fq.gz.3E.fq.sam.q20.sorted.bam - &
samtools view -h -q 20 2_maize-A15_30_1-PAS_all_clean.fq.gz.5E.fq.sam | samtools sort -o 2_maize-A15_30_1-PAS_all_clean.fq.gz.5E.fq.sam.q20.sorted.bam - &
samtools view -h -q 20 2_maize-A15_30_1-PAS_all_clean.fq.gz.T.3E.fq.sam | samtools sort -o 2_maize-A15_30_1-PAS_all_clean.fq.gz.T.3E.fq.sam.q20.sorted.bam - &
samtools view -h -q 20 2_maize-A15_30_1-PAS_all_clean.fq.gz.T.5E.fq.sam | samtools sort -o 2_maize-A15_30_1-PAS_all_clean.fq.gz.T.5E.fq.sam.q20.sorted.bam - &

#
perl 02_combine_bam.pl 2_maize-A15_30_1-PAS_all_clean.fq.gz.3E.fq.sam.q20.sorted.bam 2_maize-A15_30_1-PAS_all_clean.fq.gz.5E.fq.sam.q20.sorted.bam 2_maize-A15_30_1-PAS_all_clean.fq.gz.T.3E.fq.sam.q20.sorted.bam 2_maize-A15_30_1-PAS_all_clean.fq.gz.T.5E.fq.sam.q20.sorted.bam maize-A15_30_1-PAS.A.bam maize-A15_30_1-PAS.T.bam

#
samtools view -bS maize-A15_30_1-PAS.A.bam | samtools sort -o maize-A15_30_1-PAS.A.bam.sorted - &
samtools view -bS maize-A15_30_1-PAS.T.bam | samtools sort -o maize-A15_30_1-PAS.T.bam.sorted - &

#
bedtools bamtobed -i maize-A15_30_1-PAS.A.bam.sorted >maize-A15_30_1-PAS.A.bam.sorted.bam.bed &
bedtools bamtobed -i maize-A15_30_1-PAS.T.bam.sorted >maize-A15_30_1-PAS.T.bam.sorted.bam.bed &

#
perl get_TSS.pl maize-A15_30_1-PAS.A.bam.sorted.bam.bed >maize-A15_30_1-PAS.A.bam.sorted.bam.bed.ctss &
perl get_TSS.pl maize-A15_30_1-PAS.T.bam.sorted.bam.bed >maize-A15_30_1-PAS.T.bam.sorted.bam.bed.ctss &

