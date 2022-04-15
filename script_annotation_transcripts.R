################################################################################
## annotacion
## Biologia de Sistemas - UFPR
################################################################################
load("targetNBL_counts.RData")

ens.str <- data@rowRanges$ensembl_gene_id


# -- anotacao com AnnotationHub
ah = AnnotationHub()
edb <- query(ah, pattern = c("Homo sapiens", "EnsDb"))[[1]]
gns <- genes(edb)
EnsDbAnnotation <- as.data.frame(gns)
EnsDbAnnotation <- EnsDbAnnotation[,c("gene_id","symbol","gene_biotype",
                                      "entrezid")]
dim(EnsDbAnnotation)
colnames(EnsDbAnnotation) <- c("ensemblid","symbol","gene_biotype","entrezid")

all(ens.str%in%rownames(EnsDbAnnotation))

rowAnnotation <- EnsDbAnnotation[ens.str,]
dim(rowAnnotation)
table(rowAnnotation$gene_biotype)

save(rowAnnotation, file = "annotation.RData")
write.csv(rowAnnotation, file = "annotation.csv")
################################################################################


