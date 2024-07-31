minimap2 -ax splice -t 30 -uf --secondary=no -C5 C7-2.v1.fa clustered.hq.singletons.filter.NGS_corrected.fasta >all.polished.minimap2.C72.sam

sort -k 3,3 -k 4,4n all.polished.minimap2.C72.sam >all.polished.minimap2.C72.sorted

collapse_isoforms_by_sam.py --input clustered.hq.singletons.filter.NGS_corrected.fasta -s all.polished.minimap2.C72.sorted -o polished_trans
