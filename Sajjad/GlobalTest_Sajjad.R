source('~/Clean_Multiomics/Compact_Functions/LocalMetric_Predict.R')
source('~/Clean_Multiomics/Compact_Functions/GlobalKL.R')


Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')

#load the data
setwd('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed')
PCAres=prcomp(t(Raw))$x[,1:2]
EList=list()
#EList[[1]]=PCAres
#EList[[2]]=readRDS('Plain_tsne')
#EList[[3]]=readRDS('PCA_1')
#EList[[4]]=readRDS('Grassman_1')
#EList[[5]]=readRDS('Grassmann_1_10_30')
#EList[[6]]=readRDS('MVPCA_10_10_Method1')
#EList[[7]]=readRDS('MultiviewPCA_30_30')

EList[[1]]=readRDS('Plain_tsne')
EList[[2]]=readRDS('UMAP')
EList[[3]]=t(readRDS('LargeVis'))

Res=GlobalKL(t(Raw),EList,PointLab)
rownames(Res)=c('tSNE','UMAP','LargeVis')
#rownames(Res)=c('NullPCA','tSNE','PCA_1','Grassman_1','Grassman_1_10_30','MVPCA_10_10','MVPCA_30_30')
