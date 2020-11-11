#purpose: run the phase transition experiment on the TCGA dataset (our high modularity dataset)
library('igraph')
library('largeVis')

#create graph of dataset
Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX_NoDup')
PointLab=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/nodelabs_NoDup')

#TGraph=largeVis(t(Raw))$wij
#graph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)
#saveRDS(graph,'~/Clean_Multiomics/Fixed-7/Preg7_graph')
graph=readRDS('~/Clean_Multiomics/Fixed-7/Preg7_graph')

source('~/Clean_Multiomics/Compact_Functions/PhaseShift.R')
source('~/Clean_Multiomics/Compact_Functions/Gen_Unif.R')

print('graph completed')

#now starting exeperiment
Res=PhaseShift(Raw,PointLab,graph)
