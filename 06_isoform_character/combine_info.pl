#!/usr/bin/perl
use strict;


open FILE,"$ARGV[0]";
my %hash_ribo;
while(<FILE>){
	chomp;
	my @aa = split;
	my @temp;
	for(my $n=1;$n<@aa;$n++){push @temp,$aa[$n]}
	@temp = sort {$a<=>$b} @temp;
	$hash_ribo{$aa[0]} = $temp[-1];
}
close FILE;


open FILE,"$ARGV[1]";
my %hash_ex;
while(<FILE>){
        chomp;
        my @aa = split;
        my @temp;
        for(my $n=1;$n<@aa;$n++){push @temp,$aa[$n]}
        @temp = sort {$a<=>$b} @temp;
	$hash_ex{$aa[0]} = $temp[-1];
}
close FILE;

my %hash_pme;
open FILE,"$ARGV[2]";
while(<FILE>){
        chomp;
        my @aa = split;
        my @temp;
        for(my $n=1;$n<@aa;$n++){push @temp,$aa[$n]}
        @temp = sort {$a<=>$b} @temp;
        $hash_pme{$aa[0]} = $temp[-1];
}
close FILE;

open FILE,"$ARGV[3]";
my %hash_orf;
while(<FILE>){
        chomp;
        my @aa = split;
        my @temp;
        for(my $n=1;$n<@aa;$n++){push @temp,$aa[$n]}
        @temp = sort {$a<=>$b} @temp;
        $hash_orf{$aa[0]} = $temp[-1];
}
close FILE;

open FILE,"$ARGV[4]";
while(<FILE>){
	chomp;
	my @aa = split;
	print "$aa[0]\t$hash_ex{$aa[0]}\t$hash_ribo{$aa[0]}\t$hash_pme{$aa[0]}\t$hash_orf{$aa[0]}\n";
}
close FILE;
