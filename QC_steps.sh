#run this in the directory containing bam and vcf files
prefix=gruber_WES_b1

cat *.hs_metrics.txt | head -n7 | tail -n1 > ${prefix}_coverage.txt && grep  -e '^exome_evaluation_regions'  *.hs_metrics.txt | sed 's/'.hs_metrics.txt:exome_evaluation_regions'//' >> ${prefix}_coverage.txt

cat *.selfSM | head -n1  > ${prefix}_selfSM.txt && grep  -v '^#'  *.selfSM | sed 's/^.*://'  >> ${prefix}_selfSM.txt

module load VCFtools/0.1.16-GCCcore-10.2.0-Perl-5.32.0

vcftools --gzvcf ${prefix}.vcf.gz --relatedness2 --out ${prefix}

vcftools --gzvcf ${prefix}.vcf.gz --chr chrX --from-bp 2781479 --to-bp 155701382 --het --out ${prefix}

