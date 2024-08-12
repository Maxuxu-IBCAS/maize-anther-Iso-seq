STAR --runThreadN 30 --runMode genomeGenerate --genomeDir ./transcript  --genomeFastaFiles all.collapsed.rep.fa --genomeSAindexNbases 11 --genomeChrBinNbits 12

STAR --runThreadN 6 --genomeDir ./transcript/ --readFilesIn C72-0-5-rep1.R1.fq.gz.clean.fastq C72-0-5-rep1.R2.fq.gz.clean.fastq --outFileNamePrefix C72-0-5-rep1 --outSAMtype BAM Unsorted --outSAMmode NoQS --outSAMattributes NH NM --seedSearchLmax 10 --outFilterMultimapScoreRange 0 --outFilterMultimapNmax 255 --outFilterIntronMotifs RemoveNoncanonical 

salmon quant -t all.collapsed.rep.fa -l ISR -a C72-0-5-rep1Aligned.out.bam -o C72-0-5.salmon -p 10 &
