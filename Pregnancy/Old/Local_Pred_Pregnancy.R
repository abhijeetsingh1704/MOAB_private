source('~/Clean_Multiomics/Compact_Functions/Trustworthy.R')
source('~/Clean_Multiomics/Compact_Functions/Trustworth_General.R')
source('~/Clean_Multiomics/Compact_Functions/GlobalMetric.R')

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

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_tSNE=Res[[1]]



#################
#PC_1
#################

print('PCA')

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/PCA_1')

kMat_PCA_1=c()

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_PCA_1=Res[[1]]

####################
#Grassman 1#########
####################

print('Grassman 1')

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Grassman_1')

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_Grassman_1=Res[[1]]

#####################
#Grassman_1_10_30###
######################

print('Grassman 1, 2')

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Grassman_1_10_30')

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_Grassman_1_10_30=Res[[1]]

#####################
##Multiview PCA_30_30
#####################
print('multiview pca 30')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/MVPCA_30_30')

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_MultiviewPCA_30_30=Res[[1]]
###############################
##Multiview PCA with different parameters
################################
print('multiview pca 10')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/MVPCA_10_10')
Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_MultiviewPCA_10_10=Res[[1]]
