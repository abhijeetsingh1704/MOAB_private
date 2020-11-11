source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')
source('~/Clean_Multiomics/General/SampEmbed_Sub.R')

Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

#########
#tSNE
########

#read in data
#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/April9_tSNE')
#tEmbed=tEmbed$Y
#kVals=c(10,25,50,75,100,200,300)

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

#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/PCA_1')
#kVals=c(10,25,50,75,100,200,300)

#kMat_PCA_1=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
#kMat_PCA_1[i,]=Res
#}
#rownames(kMat_PCA_1)=kVals
####################
#Grassman 1#########
####################

#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Grassman_1')
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
#grassman_10_30###
######################
#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Grassman_1_10_30')
#kVals=c(10,25,50,75,100,200,300)
#print('read!')
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

#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/MVPCA_30_30')
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

#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/MVPCA_10_10')
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


####UMAP results###


#tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/UMAP')
#kVals=c(10,25,50,75,100,200,300)

#kMat_UMAP=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,t(Raw),PointLab,kVals[i],0)
#print(mean(Res))
#kMat_UMAP[i,]=Res
#}
#rownames(kMat_UMAP)=kVals


###largeVis results
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/LargeVis_Affin2')
kVals=c(10,25,50,75,100)

kMat_LV=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampEmbedSub(tEmbed,t(Raw),PointLab,kVals[i],0,c(1,2))
print(mean(Res))
kMat_LV[i,]=Res
}
rownames(kMat_LV)=kVals

