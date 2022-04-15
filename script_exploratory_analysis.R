################################################################################
## exploratory analysis
## Biologia de Sistemas - UFPR
################################################################################
load("targetNBL_counts_noted.RData")

# -- "primeira camada"
assay(data)     # matrix de contagens
colData(data)   # dados das amostras
rowRanges(data) # dados dos transcritos

# -- miRNAs
table(data@rowRanges$gene_biotype) # qtd de cada tipo de transcritos
mat_mirna <- assay(data[data@rowRanges$gene_biotype=="miRNA",]) # matriz de miRNA
data_mirna <- data[data@rowRanges$gene_biotype=="miRNA",] # objeto miRNA
################################################################################

