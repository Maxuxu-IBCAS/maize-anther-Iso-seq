CNCI.py -f isoform_with_len_less_than_300.fa -o CNCI_detected_longnoncoding -m pl -p 6 -d ./ 

python /mnt/maxuxu/software/CPC2-beta/bin/CPC2.py -i isoform_with_len_less_than_300.fa -o cpc2_predicted 

python /mnt/maxuxu/software/PLEK.1.2/PLEK.py -fasta isoform_with_len_less_than_300.fa -out plek_predicted -thread 10 

transeq -clean isoform_with_len_less_than_300.fa isoform_with_len_less_than_300.pro
pfam_scan.pl -fasta isoform_with_len_less_than_300.pro -dir pfam_database -cpu 2 -outfile isoform_with_len_less_than_300.PfamScan -as

