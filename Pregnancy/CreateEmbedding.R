library('umap')
library('igraph')
library('MASS')
library('FNN')
Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
Raw=t(Raw)
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

library('dimRed')
library('mp')
#####Preliminary work for multiomics scaffold########

#instead of sampling use IL6 and PGF from proteomics
#protInds=which(PointLab==3)

#IL6 inds
#IL6Inds=grepl('^IL6$',rownames(Raw))
#IL6=which(IL6Inds==TRUE)
#intIL6=intersect(protInds,IL6)

#PGFInds=grepl('^PGF$',rownames(Raw))
#PGF=which(PGFInds==TRUE)
#intPGF=intersect(protInds,PGF)

#tabVals=table(PointLab)
#inds=c()
#for(i in c(1:3)){
#numSamp=min(tabVals[i],500)
#sampVal=sample(which(PointLab==i),numSamp,replace=FALSE)
#inds=c(inds,sampVal)
#}

#inds=c(intIL6,intPGF)
		
#get the indices of the kNN

#indVec=c()

#for(d in 1:length(inds)){
#forOrder=knnx.index(Raw,t(Raw[inds[d],]),k=10)
#indVec=c(indVec,forOrder)
#}

#indVec=unique(indVec)
#do initial configuration
#tRes=Rtsne(Raw[indVec,])
#lo=tRes$Y

#lo=forceScheme(dist(Raw[inds,]))

#scale lo
#a=-.5
#b=5
#lo=(b-(a))*((lo-min(lo))/(max(lo)-min(lo)))+(a)

####################################################

#LAMP (lamp with the scaffold)
#Out=lamp(Raw,inds,Ys=lo,cp=1)
#Out=lamp(Raw)
#saveRDS(inds,'~/shit/inds')

################

#######
#PCA#
########

prcompY=prcomp(Raw)$x
pcRes=prcompY[,1:2]
print('done with PCA')
saveRDS(pcRes,'~/Clean_Multiomics/Embeddings/Pregnancy/PCA')
#########
#lamp#####
##########

OutLamp=lamp(Raw)
print('done with lamp')
saveRDS(OutLamp,'~/Clean_Multiomics/Embeddings/Pregnancy/Lamp')
###########
#peklaska#
##########

dMat=dist(Raw)
peskRes=pekalska(dMat)
saveRDS(peskRes,'~/Clean_Multiomics/Embeddings/Pregnancy/Pesk')
stop('')


#plmp
#Out=plmp(Raw,indVec,Ys=lo)


stop('')



#create a kNN graph using the largeVis
#lo=largeVis(t(Raw))
#stop('done')


#lo=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/LargeVis')
#lo=t(lo)
#determine the indicators
#IndMat=matrix(0,nrow=nrow(Raw),ncol=max(PointLab))
#for(i in 1:max(PointLab)){
#relInds=which(PointLab==i)
#IndMat[relInds,i]=1
#}


###playing with affinity matrix
#Create affinity matrix
#Aff=matrix(2,nrow=3,ncol=3)
#diag(Aff)=1
#print('starting affinity')
#create affinity
#Mu=IndMat%*%Aff%*%t(IndMat)
#Inds=which(lo$wij==0)
#Mu[Inds]=0
#My=Matrix(Mu,sparse=TRUE)
#Final=lp$wij*My
#coords=projectKNNs(wij=Final)
#coords=t(coords)



#kGraph=graph.adjacency(lo[[1]],mode='undirected')
#lay=layout_with_fr(kGraph)

#now use sammon 
#dMat=dist(Raw)
#print('done with dMat')
#SMap=sammon(dMat)

#now use AutoEncoder
#embed_methods='LLE'
#data_emb=lapply(embed_methods,function(x) embed(Raw,x))
#lo=getDimRedData(data_emb[[1]])
#lo=lo@data
