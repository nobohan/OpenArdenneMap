pdfjam --outfile brugelette_testA4.pdf --landscape --paper a4paper OAM_brugelette_full_A4.pdf &&
pdfjam --outfile brugelette_A1.pdf --landscape --paper a1paper OAM_brugelette_full_A1.pdf &&
mutool poster -x 4 -y 2 brugelette_A1.pdf brugelette_A1_in_A4.pdf
