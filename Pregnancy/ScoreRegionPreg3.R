#Purpose:
#we are trying to see if we can construct a graph so that we can automatically detect the noise points in each cluster


library('igraph')
library('largeVis')

#load dataset
#Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
#PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

#RndStuff=Gen_Unif(Raw,1000)
#print('running largeVis')
#construct the network representation by using largeVis
#LVOut=largeVis(t(RndStuff))

#print('done running largeVis!')
#wGraph=LVOut$wij
#BuildGraph=graph.adjacency(wGraph,mode='undirected',weighted=TRUE)
#ModPointLab=c(PointLab,rep(4,1000))
#stop('test done')
#########################################
#apply Louvain 
#findComm=cluster_louvain(BuildGraph,weights=E(BuildGraph)$weight)
#findComm=membership(findComm)

#name the nodes 
#V(BuildGraph)$name=c(1:vcount(BuildGraph))

#print('starting core decomposition')

#define the function Get2Core
#Get2Core=function(Graph){
#MinDeg=1
#ToDelete=c()
#degVec=degree(Graph)
#medVal=25 #median(degVec)
#while(MinDeg<medVal){
#ToDelete=which(degVec<medVal)
#Graph=delete_vertices(Graph,v=ToDelete)
#degVec=degree(Graph)
#MinDeg=min(degVec)
#}
#Graph
#}

#now go through each community 
#ScoreVec=c()
#RandNum=c()
#PropRemove=c()
#store indices of nodes we are removing
#RemoveNodes=c()
#for(i in 1:max(findComm)){
#relInds=which(findComm==i)
#get subgraph
#SG=induced_subgraph(BuildGraph,relInds)

#get mean degree
#gM=mean(degree(SG))

#find the 2 core
#get2C=Get2Core(SG)

#just to see, see if there are any that lose nodes from 2 core
#orig=vcount(SG)
#new=vcount(get2C)

#get the set diff between the nodes in the full graph and the nodes in the subgrapj
#diffNodes=setdiff(V(SG)$name,V(get2C)$name)
#print(V(get2C)$name)
#RemoveNodes=c(RemoveNodes,diffNodes)

#identify the random nodes
#randNodeInds=which(ModPointLab==8)
#IntVals=intersect(relInds,randNodeInds)


#if(length(IntVals)>0){
#score=length(which(is.element(IntVals,diffNodes)))/length(IntVals)
#}

#else{score=1}
#ScoreVec=c(ScoreVec,score)

#print(score)
#RandNum=c(RandNum,length(IntVals))

#PropRemove=c(PropRemove,length(diffNodes)/vcount(SG))

#}
#stop('test complete')

#######now is the PC correlation test exp
ForTest=t(RndStuff)
#step 1: PCA
PCRes=prcomp(ForTest)$x

overallMat=rep(0,ncol(RndStuff))
nonExclude=c(1:vcount(BuildGraph))[-RemoveNodes]
sampInds=c(sample(nonExclude,1000,replace=FALSE),RemoveNodes)


for(i in sampInds){
print(i)
getVec=RndStuff[i,]
tempStore=c()
for(j in 1:ncol(PCRes)){
tempStore=c(tempStore,cor(PCRes[,j],getVec))
}
#tempStore=(tempStore-min(tempStore))/(max(tempStore)-min(tempStore))
overallMat=rbind(overallMat,tempStore)
overallMat
}
stop('')



#define a score to node vec
#CorrectProp=1-PropRemove
#extend proportions to individual nodes
#PropNode=CorrectProp[findComm]

###################
#now make a graph representation from the embedding
#Tolo=readRDS('~/shit/April9_tSNE')$Y
#TGraph=largeVis(t(Tolo))

#TGraph=TGraph$wij
#TGraph=graph.adjacency(TGraph,mode='undirected',weighted=TRUE)

#findComm=cluster_louvain(TGraph,weights=E(TGraph)$weight)
#findCommTsne=membership(findComm)


#print('done with tSNE')

Ulo=readRDS('~/shit/UMAP')
UGraph=largeVis(t(Ulo))

UGraph=UGraph$wij
UGraph=graph.adjacency(UGraph,mode='undirected',weighted=TRUE)

stop('test complete')

findComm=cluster_louvain(TGraph,weights=E(TGraph)$weight)
findCommUMAP=membership(findComm)

