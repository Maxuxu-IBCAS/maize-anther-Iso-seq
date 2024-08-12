#!/usr/bin/perl
use strict;


my %hash;

open FILE,"$ARGV[0]";

while(<FILE>){
	chomp;
	my @aa = split;
	my @bb = split /\./,$aa[0];
	my $temp;
	for(my $n=1;$n<@aa;$n++){
		$temp = $temp."$aa[$n]";
	}	
	if(exists $hash{$bb[1]}){
		$hash{$bb[1]} = "$hash{$bb[1]}"."\t"."$temp";
	}else{
		$hash{$bb[1]} = $temp;
	}
}
close FILE;


foreach my $aa(keys %hash){
	my $label = $hash{$aa};
	my $ti;
	if($label =~ /full-splice_match|incomplete-splice_match|novel_in_catalog|novel_not_in_catalog/){
		$ti = "genic";
	}elsif($label =~ /antisense|fusion|genic_intron/){
		$ti = "NA";
	}elsif($label =~ /intergenic/){
		$ti = "intergenic";
	}else{
		$ti = "NA";
	}
	print "PB.$aa\t$ti\n";
}
