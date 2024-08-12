#!/usr/bin/perl
use strict;


my %hash_chr;
my %hash_start;
my %hash_reads;

open FILE,"$ARGV[0]";

while(<FILE>){
	chomp;
	my @aa = split;
	if(exists $hash_chr{$aa[-1]}){
		push @{$hash_reads{$aa[-1]}},$aa[2];
	}else{
		$hash_chr{$aa[-1]}= $aa[0];
		$hash_start{$aa[-1]} = $aa[1];
		push @{$hash_reads{$aa[-1]}},$aa[2];
	}
}
close FILE;

foreach my $aa(keys %hash_reads){
	my $chr = $hash_chr{$aa};
	my $P_start = $hash_start{$aa};
	my @reads = @{$hash_reads{$aa}};
	my $total;
	foreach my $read(@reads){
		$total += $read;
	}
	
	my $len = @reads;
	my $win_number = int(($len-60)/10)+1;

	for(my $n=1;$n<=$win_number;$n++){
		my $start = 0+10*($n-1);
                my $end = 0+10*($n-1)+59;
		my $win_total;
		my @val;
		for(my $m = $start;$m<=$end;$m++){
			$win_total += $reads[$m];
			my $temp = int($m/3);
			$val[$temp]+=$reads[$m];
		}
		next if($win_total<20);
		my $ent;
		foreach my $val(@val){
			next if($val == 0);
			my $p = $val/$win_total;
			$ent+=$p*log(1/$p);
                }
		my $mean = $win_total/20;
		my $ten;
		for(my $m =1;$m<=20;$m++){
			my $p= $mean/$win_total;
                        $ten+=$p*log(1/$p);
                }
                my $per;
                if ($ten == 0) {
                        $per=1;
                } else {
                        $per=$ent/$ten;
                }
		my $chr_s = $P_start+$start;
		my $chr_e = $P_start+$end;
		print "$aa\t$chr\t$chr_s\t$chr_e\t$win_number\t$win_total\t$n\t$per\n";
	}
}
close FILE;
		
