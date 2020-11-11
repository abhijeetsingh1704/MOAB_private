
source('~/Clean_Multiomics/Compact_Functions/GlobalMetric.R')
Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')
library('FNN')

#########
#tSNE
########

#read in data
tEmbed=tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Plain_tsne')
kVals=seq(from=5,to=250,by=10)

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_tSNE=Res[[1]]



#################
#PC_1
#################

print('PCA')

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/PCA_1')

kMat_PCA_1=c()

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_PCA_1=Res[[1]]

####################
#Grassman 1#########
####################

print('Grassman 1')

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Grassman_1')

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_Grassman_1=Res[[1]]

#####################
#Grassman_1_10_30###
######################

print('Grassman 1, 2')

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Grassmann_1_10_30')

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_Grassman_1_10_30=Res[[1]]

#####################
##Multiview PCA_30_30
#####################
print('multiview pca 30')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/MultiviewPCA_30_30')

Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_MultiviewPCA_30_30=Res[[1]]
###############################
##Multiview PCA with different parameters
################################
print('multiview pca 10')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/MVPCA_10_10_Method1')
Res=GlobalMetric(tEmbed,t(Raw),PointLab)
kMat_MultiviewPCA_10_10=Res[[1]]
