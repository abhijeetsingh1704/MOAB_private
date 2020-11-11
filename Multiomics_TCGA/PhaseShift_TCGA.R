#PhaseShif_TCGA

library('igraph')
library('largeVis')
library('Rtsne')
library('umap')


#########################################
source('~/Clean_Multiomics/General/SampleEmbedding_GiveLab.R')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')


ModPointLab=c(PointLab,rep(4,1000))
#library('dimRed')

#create the random matrix
RndStuff=Gen_Unif(Raw,1000)

#findComm=cluster_louvain(BuildGraph,weights=E(BuildGraph)$weight)
#findComm=membership(findComm)

#find the sizes of the communities
CommSize=table(findComm)
SizeRank=order(CommSize)

Val=c()
UMAPVal=c()
TVal=c()
for(i in 1:length(SizeRank)){
CommUse=SizeRank[1:i]

#select relevant rows
RelRows=which(is.element(findComm,CommUse))

#select the subset of data
SubData=Meth[RelRows,]

#find the number of PCs for 90% of variance
PCRes=prcomp(SubData)
getCumu=summary(PCRes)[[6]][3,]

#find first value greater than 0.9
FirstVal=min(which(getCumu>=0.9))
print(FirstVal)
Val=c(Val,FirstVal)

NumGen=1000
RndStuff=Gen_Unif(SubData,NumGen)
ModPointLab=c(rep(1,length(RelRows)),rep(2,1000))

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
