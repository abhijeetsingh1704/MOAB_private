#PhaseShif_TCGA

#library('igraph')
#library('largeVis')


#load dataset
#Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
#PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

#construct the network representation by using largeVis
#LVOut=largeVis(Raw)
#print('done running largeVis!')
#wGraph=LVOut$wij
#get1=which(wGraph!=0)
#wGraph[get1]=1
#BuildGraph=graph.adjacency(wGraph,mode='undirected',weighted=TRUE)

#########################################
source('~/Clean_Multiomics/General/SampleEmbedding_GiveLab.R')

#create the random matrix
RndStuff=Gen_Unif(Raw,1000)

findComm=cluster_louvain(BuildGraph,weights=E(BuildGraph)$weight)
findComm=membership(findComm)

#find the sizes of the communities
CommSize=table(findComm)
SizeRank=order(CommSize)

Val=c()
UMAPVal=c()
TVal=c()

Raw2=t(Raw)

for(i in 1:length(SizeRank)){
CommUse=SizeRank[1:i]

#select relevant rows
RelRows=which(is.element(findComm,CommUse))

#select the subset of data
SubData=Raw2[RelRows,]

#find the number of PCs for 90% of variance
PCRes=prcomp(SubData)
getCumu=summary(PCRes)[[6]][3,]

#find first value greater than 0.9
FirstVal=min(which(getCumu>=0.9))
print(FirstVal)
Val=c(Val,FirstVal)

NumGen=1000
RndStuff=Gen_Unif(SubData,NumGen)
ModPointLab=c(PointLab[RelRows],rep(4,1000))

#umap first

loT=Rtsne(RndStuff,check_duplicates=FALSE)
loT=loT$Y

loU=umap(RndStuff)
loU=loU$layout

ResT=SampleEmbedding_GiveLab(loT,RndStuff,ModPointLab,15)
ResU=SampleEmbedding_GiveLab(loU,RndStuff,ModPointLab,15)

UMAPVal=c(UMAPVal,median(ResU))
TVal=c(TVal,median(ResT))

print('umap vec')
print(UMAPVal)

print('Tsne vec')
print(TVal)
}
