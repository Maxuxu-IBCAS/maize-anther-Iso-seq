hisat2 -p 4 --rna-strandness RF --dta -x C7-2.v1.hisat2 -1 C72-0-5-rep1.R1.fq.gz.clean.fastq -2 C72-0-5-rep1.R2.fq.gz.clean.fastq | samtools view -bS - >C72-0-5-rep1.bam 

samtools view -b -q 20 C72-0-5-rep1.bam | samtools sort -o C72-0-5-rep1.q20.sorted.bam -

stringtie -e -B -G all.collapsed.rep.gff -A C72-0-5-rep1/C72-0-5-rep1.tab -o C72-0-5-rep1/C72-0-5-rep1.gtf -l C72-0-5-rep1 C72-0-5-rep1.q20.sorted.bam
