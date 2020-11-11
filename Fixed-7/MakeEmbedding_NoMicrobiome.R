library('Rtsne')
library('umap')
library('largeVis')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')
library('dimRed')

#this script makes it possible to delete a certain modality#


Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX')
PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')


#get rid of microbiome data
mbInds=which(PointLab==1)
Raw=Raw[-mbInds,]
PointLab=PointLab[-mbInds]

#tSNE
tRes=Rtsne(Raw,check_duplicates=FALSE)
tl=tRes$Y
print('done with tSNE')
saveRDS(tl,'~/Clean_Multiomics/Fixed-7/Embed_NoMB/tSNE')

#UMAP
UMapRes=umap(Raw)
UMAP=UMapRes$layout
print('done with UMAP')
saveRDS(UMAP,'~/Clean_Multiomics/Fixed-7/Embed_NoMB/UMAP')

#largeVis
LVRes=largeVis(t(Raw))
LargeVis=LVRes$coords
saveRDS(LargeVis,'~/Clean_Multiomics/Fixed-7/Embed_NoMB/LargeVis')


#triMap
#lo=TriMap_Wrap(Raw)
#saveRDS(lo,'~/Clean_Multiomics/Fixed-7/Embeddings/TriMap')

#PCA
#pr=prcomp(Raw)$x[,1:2]
#saveRDS(pr,'~/Clean_Multiomics/Fixed-7/Embeddings/PrComp')


#Laplacian Eigenmaps
#embed_methods='LaplacianEigenmaps'
#data_emb=lapply(embed_methods,function(x) embed(Raw,x))
#lo=getDimRedData(data_emb[[1]])
#lo=lo@data
#saveRDS(lo,'~/Clean_Multiomics/Fixed-7/Embeddings/Laplacian_Eigenmap')

#embed_methods='DiffusionMaps'
#data_emb=lapply(embed_methods,function(x) embed(Raw,x))
#lo=getDimRedData(data_emb[[1]])
#lo=lo@data
#saveRDS(lo,'~/Clean_Multiomics/Fixed-7/Embeddings/DiffusionMaps')

