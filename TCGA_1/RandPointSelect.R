library('umap')
library('Rtsne')
library('largeVis')
library('igraph')
library('MASS')
source('~/Clean_Multiomics/Compact_Functions/Gen_Unif.R')
source('~/Clean_Multiomics/General/SampleEmbedding_GiveLab.R')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')

#purpose: for selecting the only modality we care about looking at 

Raw=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/AllX')
PointLab=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/nodelabs')

#here we are selecting microbiome
RelInds=which(PointLab==2)
Raw=Raw[RelInds,]
PointLab=PointLab[RelInds]

ModPointLab=c(PointLab,rep(4,1000))
#library('dimRed')

#create the random matrix
RndStuff=Gen_Unif(Raw,1000)
saveRDS(RndStuff,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/RndStuff_methyl')

#create a kNN graph using the largeVis
loLV=largeVis(t(RndStuff))
loLV=loLV$coords
loLV=t(loLV)
saveRDS(loLV,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LargeVis_methyl')
#print('done largeViz')

#stop('done')

loT=Rtsne(RndStuff,check_duplicates=FALSE)
loT=loT$Y
saveRDS(loT,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/tSNE_methyl')
print('done tSNE')

loU=umap(RndStuff)
loU=loU$layout
saveRDS(loU,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/UMAP_methyl')
print('done umap')


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

saveRDS(kMat_tSNE,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/tSNE_methyl')

kMat_umap=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(loU,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_umap[i,]=Res
}
rownames(kMat_umap)=kVals
saveRDS(kMat_umap,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/UMAP_methyl')

kMat_LV=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(loLV,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_LV[i,]=Res
}
rownames(kMat_LV)=kVals
saveRDS(kMat_LV,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/LV_methyl')

#kMat_Tri=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(loTri,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_Tri[i,]=Res
#}
#rownames(kMat_Tri)=kVals

#saveRDS(kMat_Tri,'~/Clean_Multiomics/Fixed-7/RandEmbedResult/LP_Rand_7/Tri')


