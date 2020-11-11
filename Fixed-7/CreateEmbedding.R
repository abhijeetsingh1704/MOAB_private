source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')

Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')

#lo=readRDS('~/Clean_Multiomics/Embeddings/Sajjad/DataEmbed/LargeVis')
#lo=t(lo)
#Raw=t(Raw)
#determine the indicators

#lo=largeVis(Raw)

#Raw=t(Raw)

#IndMat=matrix(0,nrow=nrow(Raw),ncol=max(PointLab))
#for(i in 1:max(PointLab)){
#relInds=which(PointLab==i)
#IndMat[relInds,i]=1
#}

#Create affinity matrix
#Aff=matrix(2,nrow=7,ncol=7)
#diag(Aff)=1

#print('starting affinity')
#create affinity
#Mu=IndMat%*%Aff%*%t(IndMat)

print('done matrix multiplication')
test=which(lo$wij!=0,arr.ind=TRUE)
My=Matrix(0,nrow=nrow(lo$wij),ncol=nrow(lo$wij),sparse=TRUE)
for(i in 1:nrow(test)){
val1=test[i,1]
val2=test[i,2]
My[val1,val2]=Mu[val1,val2]
}


#Final=lo$wij*My
#coords=projectKNNs(wij=Final)
#coords=t(coords)

