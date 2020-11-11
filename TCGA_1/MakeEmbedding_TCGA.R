library('Rtsne')
library('umap')
library('largeVis')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')
library('dimRed')
library('mp')

Raw=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/AllX')
PointLab=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/nodelabs')

#tabVals=table(PointLab)
#inds=c()
#for(i in c(1:3)){
#numSamp=min(tabVals[i],1000)
#sampVal=sample(which(PointLab==i),numSamp,replace=FALSE)
#inds=c(inds,sampVal)
#}


#do initial configuration
#tRes=Rtsne(Raw[inds,],check_duplicates=FALSE)
#lo=tRes$Y

#scale lo
#a=-4
#b=4
#lo=(b-(a))*((lo-min(lo))/(max(lo)-min(lo)))+(a)

#LAMP
#Out=lamp(Raw,inds,Ys=lo,cp=.5)
#stop('')


#tSNE
#tRes=Rtsne(Raw,check_duplicates=FALSE)
#tl=tRes$Y
#print('done with tSNE')
#saveRDS(tl,'~/Clean_Multiomics/TCGA_1/Embeddings/tSNE')

#UMAP
#UMapRes=umap(Raw)
#UMAP=UMapRes$layout
#print('done with UMAP')
#saveRDS(UMAP,'~/Clean_Multiomics/TCGA_1/Embeddings/UMAP')

#largeVis
#LVRes=largeVis(t(Raw))
#LargeVis=LVRes$coords
#print('done largeVis')
#saveRDS(LargeVis,'~/Clean_Multiomics/TCGA_1/Embeddings/LargeVis')


#triMap
#lo=TriMap_Wrap(Raw)
#saveRDS(lo,'~/Clean_Multiomics/TCGA_1/Embeddings/TriMap')
#print('done triMap')

#PCA
#pr=prcomp(Raw)$x[,1:2]
#saveRDS(pr,'~/Clean_Multiomics/TCGA_1/Embeddings/PrComp')

#Laplacian Eigenmaps
#embed_methods='LaplacianEigenmaps'
#data_emb=lapply(embed_methods,function(x) embed(Raw,x))
#lo=getDimRedData(data_emb[[1]])
#lo=lo@data
#saveRDS(lo,'~/Clean_Multiomics/TCGA_1/Embeddings/Laplacian_Eigenmap')

#embed_methods='DiffusionMaps'
#data_emb=lapply(embed_methods,function(x) embed(Raw,x))
#lo=getDimRedData(data_emb[[1]])
#lo=lo@data
#saveRDS(lo,'~/Clean_Multiomics/TCGA_1/Embeddings/DiffusionMaps')


#######
#PCA#
########

prcompY=prcomp(Raw)$x
pcRes=prcompY[,1:2]
print('done with PCA')
saveRDS(pcRes,'~/Clean_Multiomics/TCGA_1/Embeddings/PCA')
#########
#lamp#####
##########

OutLamp=lamp(Raw)
print('done with lamp')
saveRDS(OutLamp,'~/Clean_Multiomics/TCGA_1/Embeddings/Lamp')
###########
#peklaska#
##########

dMat=dist(Raw)
peskRes=pekalska(dMat)
saveRDS(peskRes,'~/Clean_Multiomics/TCGA_1/Embeddings/Pesk')
stop('')

