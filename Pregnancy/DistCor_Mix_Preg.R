source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')
source('~/Clean_Multiomics/Compact_Functions/Cor_Dist_Mix.R')

Raw=readRDS('~/Clean_Multiomics/Pregnancy/AllX_Pregnancy')
PointLab=readRDS('~/Clean_Multiomics/Pregnancy/nodelabs')

#########
#tSNE
########

#read in data
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/April9_tSNE')
tEmbed=tEmbed$Y
print('tSNE')
tSNE=Cor_Dist_Mix(Raw,tEmbed,PointLab)

####UMAP results###

print('umap')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/UMAP')
umap=Cor_Dist_Mix(Raw,tEmbed,PointLab)


###largeVis results
print('LV')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/largeVis')
LV=Cor_Dist_Mix(Raw,tEmbed,PointLab)

##############
#########local laplacian eigenmap############
#############
print('LLE')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Laplacian_Eigenmap')
LLE=Cor_Dist_Mix(Raw,tEmbed,PointLab)

##################
##diffusion map
###################
print('DM')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/Diffusion')
Diffusion=Cor_Dist_Mix(Raw,tEmbed,PointLab)

####################
#TriMap
###################
print('triMap')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Embedding_Pregnancy/TriMap')
Tri=Cor_Dist_Mix(Raw,tEmbed,PointLab)

############
####PCA#####
############
print('PCA')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/PCA')
PCA=Cor_Dist_Mix(Raw,tEmbed,PointLab)

################
##Lamp#########
################
print('Lamp')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Lamp')
Lamp=Cor_Dist_Mix(Raw,tEmbed,PointLab)

#########################
##Pesk###################
#########################
print('Pesk')
tEmbed=readRDS('~/Clean_Multiomics/Embeddings/Pregnancy/Pesk')
Pesk=Cor_Dist_Mix(Raw,tEmbed,PointLab)
