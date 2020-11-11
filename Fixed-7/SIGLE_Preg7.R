#purpose: implement the test to identtify the important bridge nodes on the 3 modality dataset

library('igraph')
library('largeVis')
library('foreach')
library('doParallel')

Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX_NoDup')
PointLab=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/nodelabs_NoDup')
source('~/Clean_Multiomics/Compact_Functions/CompCorTest.R')

#tSNE embedding
#Tolo=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/tSNE_noDup')
#TGraph=largeVis(t(Tolo))$wij

#Inds0=which(TGraph!=0)
#TGraph[Inds0]=1

#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)


#read in tSNE
#graph=readRDS('~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/tSNE_graph')
#tSNE=CompCorTest(Raw,graph)[,1]
#print(sum(tSNE))

#umap
#Tolo=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/UMAP_noDup')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/umap')
#TGraph=readRDS('~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/umap')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#umap=CompCorTest(Raw,graph)[,1]
#print(sum(umap))

#print('on largeVis')

#largeVis
#Tolo=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/LargeVis_noDup')
#TGraph=largeVis(Tolo)$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/LV')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#LV=CompCorTest(Raw,graph)[,1]
#print(sum(LV))

#Lamp
#Tolo=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/Lamp')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/Lamp')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#Lamp=CompCorTest(Raw,graph)[,1]
#print(sum(Lamp))

#diffusion
#Tolo=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/DiffusionMaps')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/Diffusion')
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#Diffusion=CompCorTest(Raw,graph)[,1]
#print(sum(Diffusion))

#triMap
#Tolo=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/triMap_noDup')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/trimap')
TGraph=readRDS('~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/trimap')
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
trimap=CompCorTest(Raw,graph)[,1]
print(sum(trimap))


print('on PCA')

#PCA
#Tolo=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/PCA_NoDup')
#TGraph=largeVis(t(Tolo))$wij
#saveRDS(TGraph,'~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/PCA')
TGraph=readRDS('~/Clean_Multiomics/Fixed-7/Layout_Graph_Preg7/PCA') 
graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
PCA=CompCorTest(Raw,graph)[,1]
print(sum(PCA))

