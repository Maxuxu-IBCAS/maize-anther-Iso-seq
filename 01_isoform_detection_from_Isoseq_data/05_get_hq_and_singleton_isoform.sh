perl get_rq_of_each_reads.pl m54061_190127_033430.subreads.bam.ccs.bam >m54061_190127_033430.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl m54061_190127_235345.subreads.bam.ccs.bam >m54061_190127_235345.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl m54061_190129_072447.subreads.bam.ccs.bam >m54061_190129_072447.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl m54061_190130_034414.subreads.bam.ccs.bam >m54061_190130_034414.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl m54061_190202_175347.subreads.bam.ccs.bam >m54061_190202_175347.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl m54061_190214_010612.subreads.bam.ccs.bam >m54061_190214_010612.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl m54136_190128_101436.subreads.bam.ccs.bam >m54136_190128_101436.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl m54136_190130_201720.subreads.bam.ccs.bam >m54136_190130_201720.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl m54136_190301_182646.subreads.bam.ccs.bam >m54136_190301_182646.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl PBL191118-C7-2-pollen-R1.subreads.bam.ccs.bam >PBL191118-C7-2-pollen-R1.subreads.bam.ccs.bam.rq.txt &
perl get_rq_of_each_reads.pl PBL191118-ZM-C72-15R1.subreads.bam.ccs.bam >PBL191118-ZM-C72-15R1.subreads.bam.ccs.bam.rq.txt &

cat *rq.txt >all_rq.txt

perl -e 'while(<>){chomp;@aa=split;$hash{$aa[0]}=$aa[1]}open FILE,"clustered.singletons.fasta";while(<FILE>){chomp;@aa=split;$aa[0]=~s/>//;chomp(my $line = <FILE>);print "$_\n$line\n" if($hash{$aa[0]}>0.999)}' all_rq.txt >clustered.singletons.filter.fasta

cat clustered.hq.fasta clustered.singletons.filter.fasta >clustered.hq.singletons.filter.fasta
