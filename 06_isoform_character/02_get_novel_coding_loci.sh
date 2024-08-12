# get intergenic loci
perl classification.pl isoform_cor_classification.txt | grep 'intergenic' >intergenic_loci

# ORF prediction
ORFfinder -in intergenic_loci.fa -ml 50 -strand plus -out intergenic_loci.orf
perl get_the_longest_orf_of_each_isoform.based_on_ORF_finder.pl intergenic_loci.orf >intergenic_loci.orf.len

# combine PME/expression/translation info and get novel coding loci
# Usage: perl combine_info.pl translation_level expression_level PME ORF_len intergenic_loci
perl combine_info.pl ribo-seq.loci.translation ssRNA-seq.loci.expression PME_matrix gene.isoform_orf_len.txt intergenic_loci | awk '$4>0.4' - | awk '$5>300' - >candidate_loci.list
