library('largeVis')
library('igraph')

#read in data
#load('~/shit/data2.rda')
#we are using the data called fmat

#make graph
mG=largeVis(fmat)$wij

#make graph
graph=graph.adjacency(mG,mode='undirected',weighted=TRUE)

#cluster graph
lRes=cluster_louvain(graph,weights=E(graph)$weight)
