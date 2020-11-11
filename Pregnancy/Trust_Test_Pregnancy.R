source('~/Clean_Multiomics/Compact_Functions/Trustworthy.R')
source('~/Clean_Multiomics/Compact_Functions/Trustworth_General.R')
Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
library('FNN')
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

#########
#tSNE
########

#read in data
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/April9_tSNE')
tEmbed=tEmbed$Y
kVals=seq(from=5,to=250,by=10)

kMat_tSNE=c()


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(Res)
kMat_tSNE=c(kMat_tSNE,Res)
}


#################
#PC_1
#################
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/PCA_1')

kMat_PCA_1=c()

for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_PCA_1=c(kMat_PCA_1,Res)
}
####################
#Grassman 1#########
####################
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Grassman_1')

kMat_Grassman_1=c()


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_Grassman_1=c(kMat_Grassman_1,Res)
}

#####################
#Grassman_1_10_30###
######################
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Grassman_1_10_30')

kMat_Grassman_1_10_30=c()


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_Grassman_1_10_30=c(Res,kMat_Grassman_1_10_30)
}

#####################
##Multiview PCA_30_30
#####################

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/MVPCA_30_30')

kMat_MultiviewPCA_30_30=c()


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_MultiviewPCA_30_30=c(kMat_MultiviewPCA_30_30,Res)
}
###############################
##Multiview PCA with different parameters
################################
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/MVPCA_10_10')

kMat_MultiviewPCA_10_10=c()


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_MultiviewPCA_10_10=c(kMat_MultiviewPCA_10_10,Res)
}
