source('~/Clean_Multiomics/Compact_Functions/LocalMetric_Predict.R')
source('~/Clean_Multiomics/Compact_Functions/GlobalCompareMetric.R')
source('~/Clean_Multiomics/Compact_Functions/GlobalKL.R')
Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')


setwd('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy')
PCAres=prcomp(t(Raw))$x[,1:2]
#EList=list()
#EList[[1]]=PCAres
#EList[[2]]=readRDS('April9_tSNE')$Y
#EList[[3]]=readRDS('PCA_1')
#EList[[4]]=readRDS('Grassman_1')
#EList[[5]]=readRDS('Grassman_1_10_30')
#EList[[6]]=readRDS('MVPCA_10_10')
#EList[[7]]=readRDS('MVPCA_30_30')

#for testing modality
EList=list()
EList[[1]]=readRDS('April9_tSNE')$Y
EList[[2]]=readRDS('UMAP')
EList[[3]]=readRDS('largeVis')

#rownames(Res)=c('NullPCA','tSNE','PCA_1','Grassman_1','Grassman_1_10_30','MVPCA_10_10','MVPCA_30_30')

#OutMat=matrix(0,nrow=length(EList),ncol=100)


#for the global metric based on clustering

#for(i in 1:length(EList)){
#getEmbed=EList[[i]]
#res=GlobalCompareMetric(getEmbed,t(Raw),100)
#OutMat[i,]=res
#}

#rownames(OutMat)=c('tSNE','PCA_1','Grassman_1','Grassman_1_10_30','MVPCA_10_10','MVPCA_30_30')


##########################
Out=GlobalKL(t(Raw),EList,PointLab)
rownames(Out)=c('tSNE','UMAP','largeVis')

#rownames(Out)=c('NullPCA','tSNE','PCA_1','Grassman_1','Grassman_1_10_30','MVPCA_10_10','MVPCA_30_30')
