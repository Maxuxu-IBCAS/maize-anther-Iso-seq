#!/usr/bin/perl
use strict;


my %hash_intron2;



open FILE,"$ARGV[0]";
while(<FILE>){
        chomp;
        my @aa = split;
        $aa[0]=~s/chr//;
        my $label = "$aa[0]"."\t"."$aa[1]"."\t"."$aa[2]";
	$hash_intron2{$label} = 1;
}
close FILE;

open FILE,"$ARGV[1]";
my %hash_intron_check1;
my %hash_intron_nu;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_intron_nu{$aa[0]}+=1;
	my $label = "$aa[1]"."\t"."$aa[2]"."\t"."$aa[3]";
	$hash_intron_check1{$aa[0]}+=1 if(exists $hash_intron2{$label});
}
close FILE;

open FILE,"$ARGV[2]";
my %hash_start;
my %hash_single;

while(<FILE>){
	chomp;
	my @aa = split;
	#$hash_single{$aa[-3]} = $aa[-2];
	$hash_start{$aa[-3]} = "Y" if($aa[-1]>0 and $aa[4] eq $aa[12]);
}
close FILE;



open FILE,"$ARGV[3]";
my %hash_end;
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_end{$aa[-3]} = "Y" if($aa[-1]>0 and $aa[4] eq $aa[12]);
}
close FILE;

my %hash_isoform;
open FILE,"$ARGV[4]";
while(<FILE>){
	chomp;
	my @aa = split;
	$hash_isoform{$aa[3]} = 1;
	$hash_single{$aa[3]} = $aa[4];
}
close FILE;

foreach my $aa(keys %hash_isoform){
	if(exists $hash_intron_nu{$aa}){
		my $ju = "N";
		$hash_intron_check1{$aa} = 0 unless(exists $hash_intron_check1{$aa});
		$ju = "Y" if($hash_intron_nu{$aa} == $hash_intron_check1{$aa});
		$hash_start{$aa} = "N" unless(exists $hash_start{$aa});
		$hash_end{$aa} = "N" unless(exists $hash_end{$aa});
		print "$aa\t$hash_single{$aa}\t$hash_start{$aa}\t$hash_end{$aa}\t$ju\t$hash_intron_nu{$aa}\t$hash_intron_check1{$aa}\n";

	}else{
		$hash_start{$aa} = "N" unless(exists $hash_start{$aa});
		$hash_end{$aa} = "N" unless(exists $hash_end{$aa});
		print "$aa\t$hash_single{$aa}\t$hash_start{$aa}\t$hash_end{$aa}\tY\t0\t0\t0\t0\n";

	}
}
	
