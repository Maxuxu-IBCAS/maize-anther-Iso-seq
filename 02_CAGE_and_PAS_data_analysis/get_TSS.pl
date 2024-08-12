#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;


while(<FILE>){
	chomp;
	my @aa = split;
	$aa[0]=~s/chr//;
	if($aa[-1] eq "+"){
		my $temp = $aa[1]+1;
		my $label = "$aa[0]"."\t"."$temp"."\t"."$aa[-1]";
		$hash{$label}+=1;
	}else{
		my $temp = $aa[2]-1;
		my $label = "$aa[0]"."\t"."$aa[2]"."\t"."$aa[-1]";
		$hash{$label}+=1;
	}
}
close FILE;

foreach my $aa(sort {$a<=>$b} keys %hash){
	print "$aa\t$hash{$aa}\n";
}

