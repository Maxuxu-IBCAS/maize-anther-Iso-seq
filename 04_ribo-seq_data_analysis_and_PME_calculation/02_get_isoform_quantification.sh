STAR --runThreadN 10 --genomeDir ./transcript/ --readFilesIn ribo_c72_1-0_rep1.clean.fq.gz.rm_rDNA.fastq --outFileNamePrefix ribo_c72_1-0_rep1 --outSAMtype BAM Unsorted --outSAMmode NoQS --outSAMattributes NH NM --seedSearchLmax 10 --outFilterMultimapScoreRange 0 --outFilterMultimapNmax 255 --outFilterMismatchNmax 0 --outFilterIntronMotifs RemoveNoncanonical 


riboprof --fasta polished_trans.collapsed.rep.fa --mrnabam C72-1-0.merged.bam --ribobam ribo_c72_1-0_rep1Aligned.out.bam --min_fplen 26 --max_fplen 31 --offset all_sample_offset.txt --sf C72-1-0.merge.quant.sf --tabd_cutoff 0 --out c72_1-0_rep1
