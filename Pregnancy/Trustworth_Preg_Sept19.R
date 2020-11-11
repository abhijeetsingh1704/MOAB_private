source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')

#Note: if this worked, it is results we are getting it from 

Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

#########
#tSNE
########

#read in data
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/April9_tSNE')
tEmbed=tEmbed$Y
kVals=c(10,25,50,75,100,200,300)

kMat_tSNE=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_tSNE[i,]=Res
}
rownames(kMat_tSNE)=kVals

####UMAP results###


tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/UMAP')
kVals=c(10,25,50,75,100,200,300)

kMat_UMAP=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_UMAP[i,]=Res
}
rownames(kMat_UMAP)=kVals


###largeVis results
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/largeVis')
kVals=c(10,25,50,75,100,200,300)

kMat_LV=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_LV[i,]=Res
}
rownames(kMat_LV)=kVals

##############
#########local laplacian eigenmap############
#############


tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Laplacian_Eigenmap')
kVals=c(10,25,50,75,100,200,300)

kMat_LE=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_LE[i,]=Res
}
rownames(kMat_LE)=kVals

##################
##diffusion map
###################

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Diffusion')
kVals=c(10,25,50,75,100,200,300)

kMat_Diffusion=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_Diffusion[i,]=Res
}
rownames(kMat_Diffusion)=kVals


####################
#TriMap
###################

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/TriMap')
kVals=c(10,25,50,75,100,200,300)

kMat_TriMap=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_TriMap[i,]=Res
}
rownames(kMat_TriMap)=kVals

############
####PCA#####
############
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/PCA')
kVals=c(10,25,50,75,100,200,300)

kMat_PCA=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_PCA[i,]=Res
}
rownames(kMat_PCA)=kVals

################
##Lamp#########
################

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Lamp')
kVals=c(10,25,50,75,100,200,300)

kMat_Lamp=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_Lamp[i,]=Res
}
rownames(kMat_Lamp)=kVals


#########################
##Pesk###################
#########################

tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Pesk')
kVals=c(10,25,50,75,100,200,300)

kMat_Pesk=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=Trustworthy_General(t(Raw),tEmbed,PointLab,kVals[i])
print(mean(Res))
kMat_Pesk[i,]=Res
}
rownames(kMat_Pesk)=kVals

