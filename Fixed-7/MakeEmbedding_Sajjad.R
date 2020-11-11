#library('Rtsne')
#library('umap')
#library('largeVis')
#source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')
library('dimRed')
library('mp')
#Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX')
#PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')

Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX_NoDup')
PointLab=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/nodelabs_NoDup')

#print('starting')
#tSNE
#tRes=Rtsne(Raw,check_duplicates=FALSE)
#tl=tRes$Y
#print('done with tSNE')
#saveRDS(tl,'~/Clean_Multiomics/Fixed-7/Embeddings/tSNE_noDup')

#UMAP
#UMapRes=umap(Raw)
#UMAP=UMapRes$layout
#print('done with UMAP')
#saveRDS(UMAP,'~/Clean_Multiomics/Fixed-7/Embeddings/UMAP_noDup')

#largeVis
#LVRes=largeVis(t(Raw))
#LargeVis=LVRes$coords
#saveRDS(LargeVis,'~/Clean_Multiomics/Fixed-7/Embeddings/LargeVis_noDup')
#stop('')

#triMap
#lo=TriMap_Wrap(Raw)
#saveRDS(lo,'~/Clean_Multiomics/Fixed-7/Embeddings/TriMap_noDup')

#PCA
#pr=prcomp(Raw)$x[,1:2]
#saveRDS(pr,'~/Clean_Multiomics/Fixed-7/Embeddings/PrComp_noDup')


#Laplacian Eigenmaps
###eigen decomposition failed
embed_methods='LaplacianEigenmaps'
data_emb=lapply(embed_methods,function(x) embed(Raw,x))
lo=getDimRedData(data_emb[[1]])
lo=lo@data
saveRDS(lo,'~/Clean_Multiomics/Fixed-7/Embeddings/Laplacian_Eigenmap')

stop('')

embed_methods='DiffusionMaps'
data_emb=lapply(embed_methods,function(x) embed(Raw,x))
lo=getDimRedData(data_emb[[1]])
lo=lo@data
saveRDS(lo,'~/Clean_Multiomics/Fixed-7/Embeddings/DiffusionMaps')

###lamp

OutLamp=lamp(Raw)
print('done with lamp')
saveRDS(OutLamp,'~/Clean_Multiomics/Fixed-7/Embeddings/Lamp')
###########
#peklaska#
##########

dMat=dist(Raw)
peskRes=pekalska(dMat)
saveRDS(peskRes,'~/Clean_Multiomics/Fixed-7/Embeddings/Pesk')
stop('')

