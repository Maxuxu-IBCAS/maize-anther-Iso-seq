#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	my $pos = "$aa[0]"."\t"."$aa[1]";
	$hash{$pos}+=1;
}
close FILE;


open FILE,"$ARGV[1]";
while(<FILE>){
	chomp;
	my @aa = split;
	
	for(my $n=$aa[1];$n<$aa[2];$n++){
		my $label = "$aa[0]"."\t"."$n";
		$hash{$label} = 0 unless(exists $hash{$label});
		print "$label\t$hash{$label}\t$aa[3]\n";
	}
}
close FILE;
