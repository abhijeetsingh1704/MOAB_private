library('umap')
library('igraph')
library('MASS')
source('~/Clean_Multiomics/Compact_Functions/Gen_Unif.R')
source('~/Clean_Multiomics/General/SampleEmbedding_GiveLab.R')
#Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
#PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')


#Raw=t(Raw)

#ModPointLab=c(PointLab,rep(8,1000))
#library('dimRed')

#create the random matrix
#RndStuff=Gen_Unif(Raw,1000)

#create a kNN graph using the largeVis
#loLV=largeVis(t(RndStuff))
#loLV=loLV$coords
#loLV=t(loLV)
#stop('done')

#loT=Rtsne(RndStuff,check_duplicates=FALSE)
#loT=loT$Y

#loU=umap(RndStuff)
#loU=loU$layout


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

kMat_umap=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(loU,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_umap[i,]=Res
}
rownames(kMat_umap)=kVals

kMat_LV=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(loLV,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_LV[i,]=Res
}
rownames(kMat_LV)=kVals




