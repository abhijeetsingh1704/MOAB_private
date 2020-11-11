library('Rtsne')
library('umap')
library('largeVis')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')
library('dimRed')
library('mp')

#run the code to load the data in
setwd('~/Clean_Multiomics/tcga_sarcoma')
source('~/Clean_Multiomics/tcga_sarcoma/Process_TCGA_Sarcoma.R')

Raw=t(AllX)

#tSNE
#tRes=Rtsne(Raw,check_duplicates=FALSE)
#tl=tRes$Y
#print('done with tSNE')
#saveRDS(tl,'~/Clean_Multiomics/tcga_sarcoma/embeddings/tSNE')

#UMAP
#UMapRes=umap(Raw)
#UMAP=UMapRes$layout
#print('done with UMAP')
#saveRDS(UMAP,'~/Clean_Multiomics/tcga_sarcoma/embeddings/UMAP')

#largeVis ##run at night
LVRes=largeVis(t(Raw))
LargeVis=LVRes$coords
print('done largeVis')
saveRDS(LargeVis,'~/Clean_Multiomics/TCGA_1/Embeddings/LargeVis')

#triMap #run on nalab2
#lo=TriMap_Wrap(Raw)
#saveRDS(lo,'~/Clean_Multiomics/tcga_sarcoma/embeddings/TriMap')
#print('done triMap')

#PCA
#pr=prcomp(Raw)$x[,1:2]
#saveRDS(pr,'~/Clean_Multiomics/tcga_sarcoma/embeddings/PrComp')

#Laplacian Eigenmaps
#embed_methods='LaplacianEigenmaps'
#data_emb=lapply(embed_methods,function(x) embed(Raw,x))
#lo=getDimRedData(data_emb[[1]])
#lo=lo@data
#saveRDS(lo,'~/Clean_Multiomics/TCGA_1/Embeddings/Laplacian_Eigenmap')

embed_methods='DiffusionMaps' #run at night
data_emb=lapply(embed_methods,function(x) embed(Raw,x))
lo=getDimRedData(data_emb[[1]])
lo=lo@data
saveRDS(lo,'~/Clean_Multiomics/tcga_sarcoma/embeddings/DiffusionMaps')


#########
#lamp#####
##########

#OutLamp=lamp(Raw)
#print('done with lamp')
#saveRDS(OutLamp,'~/Clean_Multiomics/tcga_sarcoma/embeddings/Lamp')


