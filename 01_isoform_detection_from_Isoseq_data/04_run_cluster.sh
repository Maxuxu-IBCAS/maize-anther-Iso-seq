ls *flnc.bam > flnc.fofn
isoseq3 cluster -j 30 flnc.fofn clustered.bam --verbose --use-qvs --singletons
