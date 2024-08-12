#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
my %hash;
while(<FILE>){
	chomp;
	my @aa = split;
	my @bb = split /_/,$aa[0];
	next if(/^isoform/);
	push @{$hash{$bb[0]}},$aa[5];
}
close FILE;


foreach my $aa(sort {$a<=>$b} keys %hash){
	my @temp = @{$hash{$aa}};
	my %hash_temp;
	foreach my $temp(@temp){
		$hash_temp{$temp} = 1;
	}
	print "$aa\t";
	foreach my $bb(keys %hash_temp){
		print "$bb\t";
	}
	print "\n";
}
