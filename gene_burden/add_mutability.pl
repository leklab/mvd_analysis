#!/usr/bin/perl


@lines = <>;
chomp @lines;
shift @lines;

foreach $line (@lines){
	@data = split(/\t/,$line);
	$misD_counts{$data[0]} = $data[1];
	$gene_found{$data[0]} = 0;
}



print "gene\tmutability\tobserved_counts\n";

open(F,"<0422_hs37d5_coding_idt_med_v2_spikein_padded_Mar2018_adj_19347-unique-gene_mpc-modified.txt");

@lines = <F>;
chomp @lines;
shift @lines;

foreach $line (@lines){
	@data = split(/\t/,$line);

	$gene_count = 0;

	#if(defined($gene_found{$data[1]})){
	#	$gene_found{$data[1]} = 1;
	#}


	if(defined($misD_counts{$data[1]})){
		$gene_count = $misD_counts{$data[1]};
	}


	print "$data[1]\t$data[7]\t$gene_count\n";

}

close(F);



#foreach $k (keys %gene_found){
#	if($gene_found{$k} == 0){
#		print "$k NOT_FOUND\n";
#	}
#}