#Purpose:
#we are trying to see if we can construct a graph so that we can automatically detect the noise points in each cluster


library('igraph')
library('largeVis')

#load dataset
#Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX_NoDup')
#PointLab=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/nodelabs_NoDup')

#RndStuff=Gen_Unif(Raw,1000)
#print('running largeVis')
#construct the network representation by using largeVis
#LVOut=largeVis(t(RndStuff))

#print('done running largeVis!')
#wGraph=LVOut$wij
#BuildGraph=graph.adjacency(wGraph,mode='undirected',weighted=TRUE)
#ModPointLab=c(PointLab,rep(8,1000))

#########################################
#apply Louvain 
#findComm=cluster_louvain(BuildGraph,weights=E(BuildGraph)$weight)
#findComm=membership(findComm)

#name the nodes 
V(BuildGraph)$name=c(1:vcount(BuildGraph))


#define the function Get2Core
Get2Core=function(Graph){
MinDeg=1
ToDelete=c()
degVec=degree(Graph)
medVal=25 #median(degVec)
while(MinDeg<medVal){
ToDelete=which(degVec<medVal)
Graph=delete_vertices(Graph,v=ToDelete)
degVec=degree(Graph)
MinDeg=min(degVec)
}
Graph
}

#now go through each community 
ScoreVec=c()
RandNum=c()
PropRemove=c()
for(i in 1:max(findComm)){
relInds=which(findComm==i)
#get subgraph
SG=induced_subgraph(BuildGraph,relInds)

#get mean degree
gM=mean(degree(SG))

#find the 2 core
get2C=Get2Core(SG)

#just to see, see if there are any that lose nodes from 2 core
orig=vcount(SG)
new=vcount(get2C)

#get the set diff between the nodes in the full graph and the nodes in the subgrapj
diffNodes=setdiff(V(SG)$name,V(get2C)$name)

#identify the random nodes
randNodeInds=which(ModPointLab==8)
IntVals=intersect(relInds,randNodeInds)


if(length(IntVals)>0){
score=length(which(is.element(IntVals,diffNodes)))/length(IntVals)
}

else{score=1}
ScoreVec=c(ScoreVec,score)

print(score)
RandNum=c(RandNum,length(IntVals))

PropRemove=c(PropRemove,length(diffNodes)/vcount(SG))

}


#define a score to node vec
CorrectProp=1-PropRemove
#extend proportions to individual nodes
PropNode=CorrectProp[findComm]
