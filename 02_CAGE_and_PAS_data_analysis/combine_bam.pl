#!/usr/bin/perl
use strict;


open FILE,"samtools view -h $ARGV[0] |";
open FILE2,">$ARGV[4]";
my %hash;
while(<FILE>){
	chomp;
	my @aa=split;
	if(/^@/){
		print FILE2 "$_\n";
	}else{
		print FILE2 "$_\n";
		$hash{$aa[0]} = 1;
	}
}
close FILE;

open FILE,"samtools view $ARGV[1] |";
while(<FILE>){
        chomp;
        my @aa=split;
	print FILE2 "$_\n" unless(exists $hash{$aa[0]});
}
close FILE;
close FILE2;

open FILE,"samtools view -h $ARGV[2] |";
open FILE2,">$ARGV[5]";
my %hash;
while(<FILE>){
        chomp;
        my @aa=split;
        if(/^@/){
                print FILE2 "$_\n";
        }else{
                print FILE2 "$_\n";
                $hash{$aa[0]} = 1;
        }
}
close FILE;
open FILE,"samtools view $ARGV[3] |";
while(<FILE>){
        chomp;
        my @aa=split;
        print FILE2 "$_\n" unless(exists $hash{$aa[0]});
}
close FILE;
close FILE2;


