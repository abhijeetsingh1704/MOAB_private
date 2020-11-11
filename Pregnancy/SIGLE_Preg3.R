#purpose: implement the test to identtify the important bridge nodes on the 3 modality dataset

library('igraph')
library('largeVis')
library('doParallel')
library('foreach')
#load dataset
Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

source('~/Clean_Multiomics/Compact_Functions/CompCorTest.R')

#read in the tSNE results
#Tolo=readRDS('~/shit/April9_tSNE')$Y
#TGraph=readRDS('~/Clean_Multiomics/Pregnancy/Layout_Graphs/tSNE_graph')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#tSNE=CompCorTest(t(Raw),graph)[,1]
#print(sum(tSNE))

#Tolo=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/UMAP')
#TGraph=largeVis(t(Tolo))$wij
#TGraph=readRDS('~/Clean_Multiomics/Pregnancy/Layout_Graphs/UMAP_graph')
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

