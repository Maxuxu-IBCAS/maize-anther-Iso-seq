#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash;

while(<FILE>){
	chomp;
	my @aa = split;
	my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]";
	$hash{$label} += $aa[-1];
}
close FILE;

open FILE,"$ARGV[1]";
my %hash;

while(<FILE>){
        chomp;
        my @aa = split;
        my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]";
        $hash{$label} += $aa[-1];
}
close FILE;


foreach my $aa(keys %hash){
	print "$aa\t$hash{$aa}\n";
}
