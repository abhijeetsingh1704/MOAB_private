library('umap')
library('igraph')
library('MASS')
source('~/Clean_Multiomics/Compact_Functions/Gen_Unif.R')
source('~/Clean_Multiomics/General/SampleEmbedding_GiveLab.R')
source('~/Clean_Multiomics/Compact_Functions/TriMap_Wrap.R')

#Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
#Raw=t(Raw)
#PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')
#ModPointLab=c(PointLab,rep(4,1000))
#library('dimRed')

#create the random matrix
#RndStuff=Gen_Unif(Raw,1000)
RndStuff=readRDS('~/Clean_Multiomics/Pregnancy/RandEmbed/RndStuff')

##########
#####PCA correl test######
#ForTest=t(RndStuff)
#step 1: PCA
#PCRes=prcomp(ForTest)$x

#overallMat=rep(0,ncol(RndStuff))
#sampInds=c(sample(1:28291,10000,replace=FALSE),c(28292:29291))


#for(i in sampInds){
#print(i)
#getVec=RndStuff[i,]
#tempStore=c()
#for(j in 1:ncol(PCRes)){
#tempStore=c(tempStore,cor(PCRes[,j],getVec))
#}
#tempStore=(tempStore-min(tempStore))/(max(tempStore)-min(tempStore))
#overallMat=rbind(overallMat,tempStore)
#overallMat
#}
#stop('')
#overallMat=overallMat[-1,]
#Vals0=which(overallMat==0)
#overallMat[Vals0]=overallMat[Vals0]+0.00000000001
#entVec=c()
#for(i in 1:nrow(overallMat)){
#entVal=(overallMat[i,]*log(overallMat[i,]))
#entVal=sum(entVal)*(-1)
#entVec=c(entVec,entVal)
#}




#stop('test done')

############
#create a kNN graph using the largeVis
lo=largeVis(t(RndStuff))
lo=lo$coords
lo=t(lo)
saveRDS('~/Clean_Multiomics/Pregnancy/RandEmbed/LV')
stop('done')

#lo=Rtsne(RndStuff,perplexity=100)
#lo=lo$Y

#library('ReductionWrappers')
#print(dim(RndStuff))
#oRes=optSNE(RndStuff,n_components=2)
#stop('test done')


#lo=umap(RndStuff)
#lo=lo$layout


lo=TriMap_Wrap(RndStuff)

print('done with embedding!')

#########LP test for labeled data#####
kVals=c(10,25,50,75,100,200,300)

#kMat_tSNE=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_tSNE[i,]=Res
#}
#rownames(kMat_tSNE)=kVals

#kMat_umap=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_umap[i,]=Res
#}
#rownames(kMat_umap)=kVals

#kMat_LV=matrix(0,nrow=length(kVals),ncol=30)
#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
#print(mean(Res))
#kMat_LV[i,]=Res
#}
#rownames(kMat_LV)=kVals

kMat_Tri=matrix(0,nrow=length(kVals),ncol=30)
for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbedding_GiveLab(lo,RndStuff,ModPointLab,kVals[i])
print(mean(Res))
kMat_Tri[i,]=Res
}
rownames(kMat_Tri)=kVals



