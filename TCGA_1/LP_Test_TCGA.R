source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')
Raw=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/AllX')
PointLab=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/nodelabs')


#########
#tSNE
########

#read in data
#tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/tSNE')
#kVals=c(10,25,50,75,100,200,300)
#kVals=c(500,750,1000)
#kMat_tSNE=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_tSNE[i,]=Res
#}
#rownames(kMat_tSNE)=kVals
#saveRDS(kMat_tSNE,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_tSNE')

#######################
#UMAP
#######################

#tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/UMAP')
#kVals=c(10,25,50,75,100,200,300)
#kVals=c(500,750,1000)

#kMat_UMAP=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_UMAP[i,]=Res
#}
#rownames(kMat_UMAP)=kVals
#saveRDS(kMat_UMAP,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_UMAP')


####################
#Large Vis###########
####################


#tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/LargeVis')
#kVals=c(10,25,50,75,100,200,300)
#kVals=c(500,750,1000)

#take transpose only for tEmbed
#tEmbed=t(tEmbed)


#kMat_LV=matrix(0,nrow=length(kVals),ncol=30)


#for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
#Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
#kMat_LV[i,]=Res
#}
#rownames(kMat_LV)=kVals
#saveRDS(kMat_LV,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_LV')


#############################
#PCA
##############################

tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/PCA')
kVals=c(10,25,50,75,100,200,300)

#take transpose only for tEmbed
kMat_PCA=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
kMat_PCA[i,]=Res
}
rownames(kMat_PCA)=kVals
saveRDS(kMat_PCA,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_PCA')



########
#DiffusionMaps
############
print('on diffusion maps')
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/DiffusionMaps')
kVals=c(10,25,50,75,100,200,300)

#take transpose only for tEmbed
kMat_Diffusion=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
#print('k we are on')
#print(i)
Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
kMat_Diffusion[i,]=Res
}
rownames(kMat_Diffusion)=kVals
saveRDS(kMat_Diffusion,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_Diffusion')

##################
#Laplacian eigenmap
###################
print('on Laplacian eigen')
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Laplacian_Eigenmap')
kVals=c(10,25,50,75,100,200,300)

#take transpose only for tEmbed
kMat_LEigen=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
kMat_LEigen[i,]=Res
}
rownames(kMat_LEigen)=kVals
saveRDS(kMat_LEigen,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_LEigen')


######################
#TriMap########
#####################
print('on trimap')
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/TriMap')
kVals=c(10,25,50,75,100,200,300)

#take transpose only for tEmbed
kMat_TriMap=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
kMat_TriMap[i,]=Res
}
rownames(kMat_TriMap)=kVals
saveRDS(kMat_TriMap,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_TriMap')

##############################
#Lamp
###############################
print('on lamp')
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Lamp')
kVals=c(10,25,50,75,100,200,300)

#take transpose only for tEmbed
kMat_Lamp=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
kMat_Lamp[i,]=Res
}
rownames(kMat_Lamp)=kVals
saveRDS(kMat_Lamp,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_Lamp')

#########################
#Pesk
#########################
print('on pesk')
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Pesk')
kVals=c(10,25,50,75,100,200,300)

#take transpose only for tEmbed
kMat_Pesk=matrix(0,nrow=length(kVals),ncol=30)


for(i in 1:length(kVals)){
print('k we are on')
print(i)
Res=SampleEmbeddingCompact(tEmbed,Raw,PointLab,kVals[i],0)
#print(mean(Res))
kMat_Pesk[i,]=Res
}
rownames(kMat_Pesk)=kVals
saveRDS(kMat_Pesk,'~/Clean_Multiomics/TCGA_1/LP_TCGA/kMat_Pesk')

print('on pesk')


