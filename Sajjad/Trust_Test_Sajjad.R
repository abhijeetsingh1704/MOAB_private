source('~/Clean_Multiomics/Compact_Functions/Trustworthy.R')
source('~/Clean_Multiomics/Compact_Functions/Trustworth_General.R')
library('FNN')
Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')

#########
#tSNE
########

#read in data
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Plain_tsne')
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

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/PCA_1')

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

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Grassman_1')

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
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/Grassmann_1_10_30')

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

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/MultiviewPCA_30_30')

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

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/MVPCA_10_10_Method1')

kMat_MultiviewPCA_10_10=c()


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_MultiviewPCA_10_10=c(kMat_MultiviewPCA_10_10,Res)
}
