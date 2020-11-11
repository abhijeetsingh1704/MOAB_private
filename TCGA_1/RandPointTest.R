library('umap')
library('Rtsne')
library('largeVis')
library('igraph')
library('MASS')
source('~/Clean_Multiomics/Compact_Functions/Gen_Unif.R')
source('~/Clean_Multiomics/General/SampleEmbedding_GiveLab.R')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')

Raw=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/AllX')
PointLab=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/nodelabs')

ModPointLab=c(PointLab,rep(4,1000))
#library('dimRed')

#create the random matrix
#RndStuff=Gen_Unif(Raw,1000)

#ForTest=t(RndStuff)
#step 1: PCA
#PCRes=prcomp(ForTest)$x

#overallMat=rep(0,ncol(RndStuff))

#sampInds=c(sample(1:40017,10000,replace=FALSE),c(40018:41017))

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

#saveRDS(RndStuff,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/RndStuff')


RndStuff=readRDS('~/Clean_Multiomics/TCGA_1/RandEmbedResult/RndStuff')

#create a kNN graph using the largeVis
#loLV=largeVis(t(RndStuff))
#loLV=loLV$coords
#loLV=t(loLV)
#saveRDS(loLV,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LargeVis')
#print('done largeViz')

#stop('done')

#loT=Rtsne(RndStuff,check_duplicates=FALSE)
#loT=loT$Y
#saveRDS(loT,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/tSNE')
#print('done tSNE')

#loU=umap(RndStuff)
#loU=loU$layout
#saveRDS(loU,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/UMAP')
#print('done umap')


#loTri=TriMap_Wrap(RndStuff)
#saveRDS(loTri,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/triMap')
#print('done triMap')

#PCA
#pr=prcomp(RndStuff)$x[,1:2]
#saveRDS(pr,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/PrComp')

#print('done with PCA')

#Diffusion map
#embed_methods='DiffusionMaps'
#data_emb=lapply(embed_methods,function(x) embed(RndStuff,x))
#lo=getDimRedData(data_emb[[1]])
#lo=lo@data
#saveRDS(lo,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/DiffusionMaps')

#OutLamp=lamp(RndStuff)
#print('done with lamp')
#saveRDS(OutLamp,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/Lamp')

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

#saveRDS(kMat_tSNE,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/tSNE')

#kMat_umap=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(loU,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_umap[i,]=Res
#}
#rownames(kMat_umap)=kVals
#saveRDS(kMat_umap,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/UMAP')

#kMat_LV=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(loLV,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_LV[i,]=Res
#}
#rownames(kMat_LV)=kVals
#saveRDS(kMat_LV,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/LV')

#lo=readRDS('~/Clean_Multiomics/TCGA_1/RandEmbedResult/triMap')
#kMat_Tri=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_Tri[i,]=Res
#}
#rownames(kMat_Tri)=kVals
#saveRDS(kMat_Tri,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/Tri')

#PCA
lo=readRDS('~/Clean_Multiomics/TCGA_1/RandEmbedResult/PrComp')
kMat_PCA=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_PCA[i,]=Res
}
rownames(kMat_PCA)=kVals
saveRDS(kMat_PCA,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/PCA')

#Diffusion
#lo=readRDS('~/Clean_Multiomics/TCGA_1/RandEmbedResult/DiffusionMaps')
#kMat_Diffusion=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_Diffusion[i,]=Res
#}
#rownames(kMat_Diffusion)=kVals
#saveRDS(kMat_Diffusion,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/Diffusion')

#Lamp
lo=readRDS('~/Clean_Multiomics/TCGA_1/RandEmbedResult/Lamp')
kMat_Lamp=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_Lamp[i,]=Res
}
rownames(kMat_Lamp)=kVals
saveRDS(kMat_Lamp,'~/Clean_Multiomics/TCGA_1/RandEmbedResult/LP_Rand_TCGA/Lamp')

