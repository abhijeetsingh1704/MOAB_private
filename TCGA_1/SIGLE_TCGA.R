#purpose: implement the test to identtify the important bridge nodes on the 3 modality dataset

library('igraph')
library('largeVis')
library('doParallel')
library('foreach')
#load dataset
Raw=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/AllX')
PointLab=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/nodelabs')
source('~/Clean_Multiomics/Compact_Functions/CompCorTest.R')


#tSNE
Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/tSNE')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/tSNE')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
tSNE=CompCorTest(Raw,graph)[,1]
print(sum(tSNE))

#umap
Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/UMAP')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/umap')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
umap=CompCorTest(Raw,graph)[,1]
print(sum(umap))

#largeVis
Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/LargeVis')
TGraph=largeVis(Tolo)$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/LV')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
LV=CompCorTest(Raw,graph)[,1]
print(sum(LV))

#TriMap
Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/TriMap')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/trimap')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
trimap=CompCorTest(Raw,graph)[,1]
print(sum(trimap))

#Laplacian eigenmap
Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Laplacian_Eigenmap')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/LE')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
LE=CompCorTest(Raw,graph)[,1]
print(sum(LE))

Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/PrComp')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/PCA')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
PCA=CompCorTest(Raw,graph)[,1]
print(sum(PCA))

Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/DiffusionMaps')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/Diffusion')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
Diffusion=CompCorTest(Raw,graph)[,1]
print(sum(Diffusion))

Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Lamp')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/Lamp')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
Lamp=CompCorTest(Raw,graph)[,1]
print(sum(Lamp))

Tolo=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Pesk')
TGraph=largeVis(t(Tolo))$wij
saveRDS(TGraph,'~/Clean_Multiomics/TCGA_1/Layout_Graphs/Pesk')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
Pesk=CompCorTest(Raw,graph)[,1]
print(sum(Pesk))



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

