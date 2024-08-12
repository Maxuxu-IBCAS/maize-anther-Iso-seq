perl 03_get_specific_region_FPKM_percentage.pl >candidate.list
perl combine_stage.pl >candidate.list5
perl filter.pl >candidate.list6
perl convert_format.pl candidate.list6 candidate.list7
perl classification.pl >candidate.list8
