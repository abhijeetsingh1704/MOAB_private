SampleEmbedding_GiveLab=function(Embedding,rawFeat,ModalityLabel,kk){
library('foreach')
library('doParallel')
library('igraph')
library('FastKNN')
source('~/Clean_Multiomics/Compact_Functions/TestAlignment.R')
source('~/Clean_Multiomics/Compact_Functions/LPTask.R')
source('~/Clean_Multiomics/Compact_Functions/CrossEntropy.R')
#Purpose: ths function is to take the embedding construted and to sample a large subset of features
#and quantitatively evaluate how well the attributes are aligning with the embedding. 

#inputs:
	#Embedding: the coordinates of the embedding (feature x embedding dimension)
	#rawFeat: the feature x sample matrix 
	#modality label: the vector of labels for each modality 
	#kk: the number of nearest neighbors to use for the topological embedding. 
	#ClNum: the number of clusters to use for the attributes: if 0, then we choose automatically. Otherwise we specify

entVec=c()
cl=makeCluster(25)
registerDoParallel(cl)
entVec=foreach(s=1:30,.combine='c',.packages=c('igraph','FastKNN','MASS')) %dopar% { 

source('~/Clean_Multiomics/Compact_Functions/TestAlignment.R')
source('~/Clean_Multiomics/Compact_Functions/LPTask.R')
source('~/Clean_Multiomics/Compact_Functions/CrossEntropy.R')

# ##sampling part
GetFeats=c()
ULab=unique(ModalityLabel)
for(i in 1:length(ULab)){
	RelInds=which(ModalityLabel==ULab[i])
	print(length(RelInds))
	#sample 500
	NumSamp=min(200,length(RelInds))
	sampSome=sample(RelInds,NumSamp,replace=FALSE)
	GetFeats=c(GetFeats,sampSome)

}
print('here')
print(max(GetFeats))
print(min(GetFeats))
print(dim(Embedding))
print(dim(rawFeat))
#GetFeats=sample(1:nrow(Embedding),1000,replace=FALSE)

#get the subembedding
SubEmbed=Embedding[GetFeats,]
SubDM=rawFeat[GetFeats,]

print(dim(SubEmbed))
print(dim(SubDM))

#############
#run LP thing
#############

print('setting up data for LP')

#form kNN graph between the samples based on these embedding coordinates. 
Dat=SubEmbed

k=kk
   dist_mat <- as.matrix(dist(Dat, method = "euclidean", upper = TRUE, diag=TRUE))
  nrst <- lapply(1:nrow(dist_mat), function(i) k.nearest.neighbors(i, dist_mat, k = k))
   w <- matrix(nrow = dim(dist_mat), ncol=dim(dist_mat)) ## all NA right now
   w[is.na(w)] <- 0 ## populate with 0
   for(i in 1:length(nrst)) for(j in nrst[[i]]) w[i,j] = 1

#  #create the network object
  Adj2=w
  Net=graph.adjacency(Adj2,mode='undirected')

#visualize the network
colVec=c('#FFD600', '#3F51B5','#F57C00')
V(Net)$color=colVec[ModalityLabel[GetFeats]]

#labels are just the modality labels, not clusters
CommRes=ModalityLabel[GetFeats]
############
#run alignment thing
############

print('running alignment algorithm')
print(dim(SubDM))
#run the alignment algorithm
Pval=TestAlignment(Adj2,SubDM,max(CommRes),nrow(SubDM)/2,0) ###I have previously used 500
print(Pval)
return(Pval)
} #t end 

stopCluster(cl)
entVec
} #function end

#################################
#Start Helper function
##################################

