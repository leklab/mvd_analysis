
library("dplyr")

#data = read.csv("misD_gene_counts_mutability_v2.tsv",header=T,sep="\t")
#data = read.csv("misD_BD_gene_counts_mutability.tsv",header=T,sep="\t")

data = read.csv("misD_FED_gene_counts_mutability.tsv",header=T,sep="\t")

mutability_sum = sum(data$mutability)
observed_count_sum = sum(data$observed_counts)

data$expected_counts = (data$mutability/mutability_sum) * observed_count_sum
data$fold_change = data$observed_counts/data$expected_counts

#data$p.value = binom.test(data$observed_counts, observed_count_sum, p = (data$mutability/mutability_sum), alternative = "greater")$p.value
#data %>% rowwise() %>% mutate(p.value = binom.test(observed_counts, observed_count_sum, p = mutability/mutability_sum, alternative = "greater")$p.value)

for(a in 1:dim(data)[[1]]) {
	data$p.value[a] = binom.test(data$observed_counts[a], observed_count_sum, p = (data$mutability[a]/mutability_sum), alternative = "greater")$p.value    
}


#write.table(data,"mvd_gene_burden_BD.tsv",sep='\t',row.names=FALSE,quote=FALSE)
write.table(data,"mvd_gene_burden_FED.tsv",sep='\t',row.names=FALSE,quote=FALSE)