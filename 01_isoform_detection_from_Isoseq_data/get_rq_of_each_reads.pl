#!/usr/bin/perl
use strict;


open FILE,"samtools view $ARGV[0] |";
while(<FILE>){
	chomp;
	my @aa = split;
	foreach my $aa(@aa){
		if($aa =~ /rq:f/){
			my @temp = split /:/,$aa;
			print "$aa[0]\t$temp[-1]\n";
		}
	}
}
close FILE;
