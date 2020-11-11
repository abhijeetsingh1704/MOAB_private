library('umap')
library('igraph')
library('MASS')

source('~/Clean_Multiomics/Compact_Functions/Gen_Unif.R')
source('~/Clean_Multiomics/General/SampleEmbedding_GiveLab.R')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')

Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX')
PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')


#get the indices corresponding to the first class
#Inds1=which(PointLab==1)
#Raw=Raw[-Inds1,]
#PointLab=PointLab[-Inds1]

#print(dim(Raw))

#ModPointLab=c(PointLab,rep(8,1000))
#library('dimRed')

#create the random matrix
#RndStuff=Gen_Unif(Raw,1000)
#print(dim(RndStuff))
#saveRDS(RndStuff,'~/Clean_Multiomics/Fixed-7/RandEmbedResult_NoRNA/RndStuff')

#create a kNN graph using the largeVis
#loLV=largeVis(t(RndStuff))
#loLV=loLV$coords
#loLV=t(loLV)
#saveRDS(loLV,'~/Clean_Multiomics/Fixed-7/RandEmbedResult_NoRNA/LargeVis')
#print('done largeViz')

#stop('done')

#loT=Rtsne(RndStuff,check_duplicates=FALSE)
#loT=loT$Y
#saveRDS(loT,'~/Clean_Multiomics/Fixed-7/RandEmbedResult_NoRNA/tSNE')
##print('done tSNE')

#loU=umap(RndStuff)
#loU=loU$layout
#saveRDS(loU,'~/Clean_Multiomics/Fixed-7/RandEmbedResult_NoRNA/UMAP')
#print('done umap')


#loTri=TriMap_Wrap(RndStuff)
#saveRDS(loTri,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/triMap')
#print('done triMap')

#########LP test for labeled data#####
kVals=c(10,25,50,75,100,200,300)

kMat_tSNE=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(loT,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_tSNE[i,]=Res
}
rownames(kMat_tSNE)=kVals

saveRDS(kMat_tSNE,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/tSNE_noCF')

kMat_umap=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(loU,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_umap[i,]=Res
}
rownames(kMat_umap)=kVals
saveRDS(kMat_umap,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/UMAP_noCF')

kMat_LV=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(loLV,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_LV[i,]=Res
}
rownames(kMat_LV)=kVals
saveRDS(kMat_LV,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/LV_noCF')


stop('test done')

kMat_Tri=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(loTri,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_Tri[i,]=Res
}
rownames(kMat_Tri)=kVals

saveRDS(kMat_Tri,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/Tri')


