#purpose: implement the test to identtify the important bridge nodes on the 3 modality dataset

library('igraph')
library('largeVis')
library('doParallel')
library('foreach')
#load dataset
setwd('~/Clean_Multiomics/tcga_sarcoma')
source('~/Clean_Multiomics/tcga_sarcoma/Process_TCGA_Sarcoma.R')

Raw=t(AllX)
print(dim(Raw))

PointLab=nodelab
source('~/Clean_Multiomics/Compact_Functions/CompCorTest.R')


#tSNE
#Tolo=readRDS('~/Clean_Multiomics/tcga_sarcoma/embeddings/tSNE')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/tcga_sarcoma/Layout_Graphs/tSNE')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#tSNE=CompCorTest(Raw,graph)[,1]
#print(sum(tSNE))

#umap
#Tolo=readRDS('~/Clean_Multiomics/tcga_sarcoma/embeddings/UMAP')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/tcga_sarcoma/Layout_Graphs/umap')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#umap=CompCorTest(Raw,graph)[,1]
#print(sum(umap))

#largeVis
#Tolo=readRDS('~/Clean_Multiomics/tcga_sarcoma/embeddings/LargeVis')
#TGraph=largeVis(Tolo)$wij
#saveRDS(TGraph,'~/Clean_Multiomics/tcga_sarcoma/Layout_Graphs/LV')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#LV=CompCorTest(Raw,graph)[,1]
#print(sum(LV))

#TriMap
#Tolo=readRDS('~/Clean_Multiomics/tcga_sarcoma/embeddings/TriMap')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/tcga_sarcoma/Layout_Graphs/trimap')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#trimap=CompCorTest(Raw,graph)[,1]
#print(sum(trimap))

#stop('')

#Laplacian eigenmap
#Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Laplacian_Eigenmap')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/LE')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#LE=CompCorTest(Raw,graph)[,1]
#print(sum(LE))

Tolo=readRDS('~/Clean_Multiomics/tcga_sarcoma/embeddings/PrComp')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/tcga_sarcoma/Layout_Graphs/PCA')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
PCA=CompCorTest(Raw,graph)[,1]
print(sum(PCA))

#Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/DiffusionMaps')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/Diffusion')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#Diffusion=CompCorTest(Raw,graph)[,1]
#print(sum(Diffusion))

Tolo=readRDS('~/Clean_Multiomics/tcga_sarcoma/embeddings/Lamp')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/tcga_sarcoma/Layout_Graphs/Lamp')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
Lamp=CompCorTest(Raw,graph)[,1]
print(sum(Lamp))

stop('')

#Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Pesk')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/Pesk')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#Pesk=CompCorTest(Raw,graph)[,1]
#print(sum(Pesk))



#Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/largeVis')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Pregnancy/Layout_Graphs/largeVis')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#umap=CompCorTest(t(Raw),graph)[,1]
#print(sum(umap))

#Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/largeVis')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Pregnancy/Layout_Graphs/largeVis')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#LV=CompCorTest(t(Raw),graph)[,1]

#print('done with LV')

#Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/TriMap')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Pregnancy/Layout_Graphs/TriMap')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#trimap=CompCorTest(t(Raw),graph)[,1]

#Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Laplacian_Eigenmap')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Pregnancy/Layout_Graphs/LE')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#LE=CompCorTest(t(Raw),graph)[,1]

Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/PCA')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/Pregnancy/Layout_Graphs/PCA')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
PCA=CompCorTest(t(Raw),graph)[,1]

print('done with PCA')

Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Diffusion')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/Pregnancy/Layout_Graphs/Diffusion')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
Diffusion=CompCorTest(t(Raw),graph)[,1]

Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Lamp')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/Pregnancy/Layout_Graphs/Lamp')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
Lamp=CompCorTest(t(Raw),graph)[,1]

Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Pesk')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/Pregnancy/Layout_Graphs/Pesk')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
Pesk=CompCorTest(t(Raw),graph)[,1]





#Inds0=which(TGraph!=0)
#TGraph[Inds0]=1

#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#nodelabs=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

