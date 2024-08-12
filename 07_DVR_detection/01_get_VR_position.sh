samtools depth -d 0 all.collapsed.rep.availabel.sorted.bam >all.collapsed.rep.availabel.bed
perl 01_combine_same_number_region.pl >S1.temp.bed
perl -e 'while(<>){chomp;@aa=split;my $len = $aa[2]-$aa[1];print "$_\n" if($len>=20 and $aa[3]>0)}' S1.temp.bed >S2.temp.bed
bedtools intersect -a S2.temp.bed -b locus_position.bed -wao >S2.overlap_with_locus.bed
perl 02_filter.pl >S3.temp.gtf
