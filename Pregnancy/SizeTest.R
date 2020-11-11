library('umap')
library('igraph')
library('MASS')
source('~/Clean_Multiomics/Compact_Functions/Gen_Unif.R')
source('~/Clean_Multiomics/Compact_Functions/ExploreSize.R')

Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
Raw=t(Raw)
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

library('dimRed')

#create the sampled matrix
#Raw2=ExploreSize(Raw,PointLab)

#lo=largeVis(t(Raw2))
#lo=lo$coords

#print('done large vis')

#lo2=umap(Raw2)
#lo2=lo2$layout

############################################
#####Modularity analysis#################
###########################################

#do it for each modality individually
ULab=unique(PointLab)

for(u in ULab[3:3]){
	print(u)
relInds=which(PointLab==u)

#get only the subset of rows
SubRaw=Raw[relInds,]

#do large Vis
LVRes=largeVis(t(SubRaw))
stop('test done')

Wij=LVRes$wij
getGraph=graph.adjacency(Wij,mode='undirected',weighted=TRUE)

LouvRes=cluster_louvain(getGraph)
CommRes=membership(LouvRes)
ModRes=modularity(getGraph,CommRes)
print(u)
print('num comm')
print(max(CommRes))
print(ModRes)

}


