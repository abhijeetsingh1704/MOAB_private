source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')
Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX_NoDup')
PointLab=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/nodelabs_NoDup')

#Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
#PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')

#########
#tSNE
########

#read in data
#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/tSNE_noDup')
#kVals=c(10,25,50,75,100,200,300)

#kMat_tSNE=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_tSNE[i,]=Res
#}
#rownames(kMat_tSNE)=kVals
#saveRDS(kMat_tSNE,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_tSNE_noDup')

#################
#PC_1
#################

#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/PCA_1')
#kVals=c(10,25,50,75,100,200,300)

#kMat_PCA_1=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
#kMat_PCA_1[i,]=Res
#}
#rownames(kMat_PCA)=kVals
####################
#Grassman 1#########
####################

#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Grassman_1')
#kVals=c(10,25,50,75,100,200,300)

#kMat_Grassman_1=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
#kMat_Grassman_1[i,]=Res
#}
#rownames(kMat_Grassman_1)=kVals

#####################
#Grassman_1_10_30###
######################
#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Grassmann_1_10_30')
#kVals=c(10,25,50,75,100,200,300)

#kMat_Grassman_1_10_30=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
#kMat_Grassman_1_10_30[i,]=Res
#}
#rownames(kMat_Grassman_1_10_30)=kVals
#####################
##Multiview PCA_30_30
#####################

#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/MultiviewPCA_30_30')
#kVals=c(10,25,50,75,100,200,300)

#kMat_MultiviewPCA_30_30=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
#kMat_MultiviewPCA_30_30[i,]=Res
#}
#rownames(kMat_MultiviewPCA_30_30)=kVals
###############################
##Multiview PCA with different parameters
################################

#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/MVPCA_10_10_Method1')
#kVals=c(10,25,50,75,100,200,300)

#kMat_MultiviewPCA_10_10=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
#kMat_MultiviewPCA_10_10[i,]=Res
#}
#rownames(kMat_MultiviewPCA_10_10)=kVals

#######################
#UMAP
#######################

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/UMAP_noDup')
#kVals=c(10,25,50,75,100,200,300)

#kMat_UMAP=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_UMAP[i,]=Res
#}
#rownames(kMat_UMAP)=kVals
#saveRDS(kMat_UMAP,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_UMAP_noDup')


####################
#Large Vis###########
####################


#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/LargeVis_noDup')
#kVals=c(10,25,50,75,100,200,300)

#take transpose only for tEmbed
#tEmbed=t(tEmbed)


#kMat_LV=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_LV[i,]=Res
#}
#rownames(kMat_LV)=kVals
#saveRDS(kMat_LV,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_LV_noDup')
#######################################################################

############
##TriMap####
###########

tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/triMap_noDup')
kVals=c(10,25,50,75,100,200,300)

kMat_TriMap=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
print(mean(Res))
kMat_TriMap[i,]=Res
}
rownames(kMat_TriMap)=kVals
saveRDS(kMat_TriMap,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_TriMap')

##########
#LaplacianEigen

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/Laplacian_Eigenmap')
#kVals=c(10,25,50,75,100,200,300)

#kMat_LE=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_LE[i,]=Res
#}
#rownames(kMat_LE=kVals
#saveRDS(kMat_LE,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_LE')

################
##Diffusion maps

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/DiffusionMaps')
#kVals=c(10,25,50,75,100,200,300)

#kMat_Diffusion=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_Diffusion[i,]=Res
#}
#rownames(kMat_Diffusion)=kVals
#saveRDS(kMat_Diffusion,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_Diffusion')

###################
#Lamp

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/Lamp')
#kVals=c(10,25,50,75,100,200,300)

#kMat_Lamp=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_Lamp[i,]=Res
#}
#rownames(kMat_Lamp)=kVals
#saveRDS(kMat_Lamp,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_Lamp')

#############
####Pesk

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/Pesk')
#kVals=c(10,25,50,75,100,200,300)

#kMat_Pesk=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
##print(mean(Res))
#kMat_Pesk[i,]=Res
#}
#rownames(kMat_Pesk)=kVals
#saveRDS(kMat_Pesk,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_Pesk')

##########
##PCA

tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/PCA_NoDup')
kVals=c(10,25,50,75,100,200,300)

kMat_PrComp=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
kMat_PrComp[i,]=Res
}
rownames(kMat_PrComp)=kVals
saveRDS(kMat_PrComp,'~/Clean_Multiomics/Fixed-7/LP_7/kMat_PrComp')

