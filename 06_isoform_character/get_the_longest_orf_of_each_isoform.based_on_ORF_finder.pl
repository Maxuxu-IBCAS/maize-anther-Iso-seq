#!/usr/bin/perl
use strict;

open FILE,"$ARGV[0]";
my %hash_iso;
my %hash_len;
while(<FILE>){
	chomp;
	my @aa = split;
	next unless(/>/);
	my @bb = split /\||\:/,$aa[0];
	my $len = $bb[3]-$bb[2];
	my @cc = split /_/,$bb[1];
	if(exists $hash_iso{$cc[1]}){
		$hash_iso{$cc[1]} = $aa[0] if($len > $hash_len{$cc[1]});
		$hash_len{$cc[1]} = $len if($len > $hash_len{$cc[1]});
	}else{
		$hash_iso{$cc[1]} = $aa[0];
		$hash_len{$cc[1]} = $len;
	}
}
close FILE;

open FILE,"$ARGV[0]";
while(<FILE>){
	chomp;
	my @aa = split;
	next unless(/>/);
#	$aa[0] =~ s/>//;
	my @bb = split /\||\:/,$aa[0];
	my @cc = split /_/,$bb[1];
	my $len = $bb[3]-$bb[2];
	if($hash_iso{$cc[1]} eq $aa[0]){
		print "$len\t$cc[1]\t$_\n";
	}
}
close FILE;
	
