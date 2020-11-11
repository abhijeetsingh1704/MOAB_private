source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')

Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')

#########
#tSNE
########

#read in data
#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Plain_tsne')
kVals=c(10,25,50,75,100,200,300)

#kMat_tSNE=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
#kMat_tSNE[i,]=Res
#}
#rownames(kMat_tSNE)=kVals


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

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/UMAP')
kVals=c(10,25,50,75,100,200,300)

kMat_UMAP=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
kMat_UMAP[i,]=Res
}
rownames(kMat_UMAP)=kVals


####################
#Large Vis###########
####################


tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/LargeVis')
kVals=c(10,25,50,75,100,200,300)

#take transpose only for tEmbed
tEmbed=t(tEmbed)


kMat_LV=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
kMat_LV[i,]=Res
}
rownames(kMat_LV)=kVals

