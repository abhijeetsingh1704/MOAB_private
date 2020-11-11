source('~/Clean_Multiomics/Compact_Functions/LocalMetric_Predict.R')

Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

#load the data
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


EList=list()
EList[[1]]=PCAres
EList[[2]]=readRDS('April9_tSNE')$Y
EList[[3]]=readRDS('UMAP')
EList[[4]]=readRDS('largeVis')
Res=LocalMetric_Predict(EList,t(Raw),PointLab)

rownames(Res)=c('NullPCA','tSNE','UMAP','largeVis')

#rownames(Res)=c('NullPCA','tSNE','PCA_1','Grassman_1','Grassman_1_10_30','MVPCA_10_10','MVPCA_30_30')
