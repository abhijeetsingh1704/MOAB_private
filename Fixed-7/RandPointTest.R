library('umap')
library('igraph')
library('MASS')
library('Rtsne')
library('dimRed')
library('mp')
source('~/Clean_Multiomics/Compact_Functions/Gen_Unif.R')
source('~/Clean_Multiomics/General/SampleEmbedding_GiveLab.R')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')

Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX_NoDup')
PointLab=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/nodelabs_NoDup')

ModPointLab=c(PointLab,rep(8,1000))
#library('dimRed')

#create the random matrix
#RndStuff=Gen_Unif(Raw,1000)
#saveRDS(RndStuff,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/RndStuff_NODup_Feb18')
RndStuff=readRDS('~/Clean_Multiomics/Fixed-7/RandEmbedResult/RndStuff_NODup_Feb18')


#ForTest=t(RndStuff)
#step 1: PCA
#PCRes=prcomp(ForTest)$x

#overallMat=rep(0,ncol(RndStuff))
#sampInds=c(sample(1:61092,10000,replace=FALSE),c(61093:62092))

#for(i in sampInds){
#print(i)
#getVec=RndStuff[i,]
#tempStore=c()
#for(j in 1:ncol(PCRes)){
#tempStore=c(tempStore,cor(PCRes[,j],getVec))
#}
#tempStore=(tempStore-min(tempStore))/(max(tempStore)-min(tempStore))
#overallMat=rbind(overallMat,tempStore)
#overallMat
#}
#overallMat=overallMat[-1,]
#stop('')

#create a kNN graph using the largeVis
#loLV=largeVis(t(RndStuff))
#loLV=loLV$coords
#loLV=t(loLV)
#saveRDS(loLV,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LargeVis')
#print('done largeViz')

#stop('done')

#loT=Rtsne(RndStuff,check_duplicates=FALSE)
#loT=loT$Y
#saveRDS(loT,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/tSNE_noDup_Feb18')
#print('done tSNE')

#loU=umap(RndStuff)
#loU=loU$layout
#saveRDS(loU,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/UMAP_noDup_Feb18')
#print('done umap')

#loTri=TriMap_Wrap(RndStuff)
#saveRDS(loTri,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/triMap')
#print('done triMap')

#PCA
#pr=prcomp(RndStuff)$x[,1:2]
#saveRDS(pr,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/PrComp_noDup')
#print('done with PCA')


#OutLamp=lamp(RndStuff)
#print('done with lamp')
#saveRDS(OutLamp,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/Lamp')

#print('done with Lamp')

#embed_methods='DiffusionMaps'
#data_emb=lapply(embed_methods,function(x) embed(RndStuff,x))
#lo=getDimRedData(data_emb[[1]])
#lo=lo@data
#saveRDS(lo,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/DiffusionMap')

#stop('')

#########LP test for labeled data#####
kVals=c(10,25,50,75,100,200,300)

#kMat_tSNE=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(loT,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_tSNE[i,]=Res
#}
#rownames(kMat_tSNE)=kVals

#saveRDS(kMat_tSNE,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/tSNE_noDup_Feb18')

#kMat_umap=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(loU,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_umap[i,]=Res
#}
#rownames(kMat_umap)=kVals
#saveRDS(kMat_umap,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/UMAP_noDup_Feb18')

#kMat_LV=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(loLV,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_LV[i,]=Res
#}
#rownames(kMat_LV)=kVals
#saveRDS(kMat_LV,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/LV_noDup_Feb18')
#stop('')

loTri=readRDS('~/Clean_Multiomics/Fixed-7/RandEmbedResult/triMap')
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

lo=readRDS('~/Clean_Multiomics/Fixed-7/RandEmbedResult/PrComp_noDup')
kMat_PCA=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_PCA[i,]=Res
}
rownames(kMat_PCA)=kVals
saveRDS(kMat_PCA,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/PCA')

#lamp
lo=readRDS('~/Clean_Multiomics/Fixed-7/RandEmbedResult/Lamp')

kMat_Lamp=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_Lamp[i,]=Res
}
rownames(kMat_Lamp)=kVals
saveRDS(kMat_Lamp,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/Lamp')

#diffusion map
#lo=readRDS('~/Clean_Multiomics/Fixed-7/RandEmbedResult/DiffusionMap')

#kMat_DM=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_DM[i,]=Res
#}
#rownames(kMat_DM)=kVals
#saveRDS(kMat_DM,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/DM')



