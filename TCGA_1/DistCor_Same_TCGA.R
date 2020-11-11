source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')
source('~/Clean_Multiomics/Compact_Functions/Cor_Dist_SameModality.R')

Raw=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/AllX')
PointLab=readRDS('~/Clean_Multiomics/TCGA_1/Multiomics_TCGA/nodelabs')


#########
#tSNE
########

#read in data
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/tSNE')
tSNE=Cor_Dist_SameModality(Raw,tEmbed,PointLab)


#######################
#UMAP
#######################

tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/UMAP')
umap=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

####################
#Large Vis###########
####################

tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/LargeVis')
tEmbed=t(tEmbed)
LV=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

#############################
#PCA
##############################

tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/PCA')
PCA=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

########
#DiffusionMaps
############
print('on diffusion maps')
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/DiffusionMaps')

Diffusion=Cor_Dist_SameModality(Raw,tEmbed,PointLab)


##################
#Laplacian eigenmap
###################
print('on Laplacian eigen')
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Laplacian_Eigenmap')

LLE=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

######################
#TriMap########
#####################
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/TriMap')
TriMap=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

##############################
#Lamp
###############################
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Lamp')
Lamp=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

#########################
#Pesk
#########################
tEmbed=readRDS('~/Clean_Multiomics/TCGA_1/Embeddings/Pesk')
Pesk=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

