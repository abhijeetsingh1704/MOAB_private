source('~/Clean_Multiomics/General/SampleEmbeddingCompact.R')

#only use this version when you remove duplicate data
Raw=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/AllX_NoDup')
PointLab=readRDS('~/Clean_Multiomics/Fixed-7/FIxed_Sajjad_Multiomics/nodelabs_NoDup')

source('~/Clean_Multiomics/Compact_Functions/Cor_Dist_SameModality.R')

#Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
#PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')

#########
#tSNE
########

#read in data
#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/tSNE_noDup')
#tSNE=Cor_Dist_SameModality(Raw,tEmbed,PointLab)
#######################
#UMAP
#######################

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/UMAP_noDup')
#umap=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

####################
#Large Vis###########
####################

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/LargeVis_noDup')
#tEmbed=t(tEmbed)
#LV=Cor_Dist_SameModality(Raw,tEmbed,PointLab)
#######################################################################

############
##TriMap####
###########

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/TriMap')
#Tri=Cor_Dist_SameModality(Raw,tEmbed,PointLab)


##########
#LaplacianEigen

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/Laplacian_Eigenmap')
#LLE=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

################
##Diffusion maps

tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/DiffusionMaps')
Diffusion=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

###################
#Lamp

tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/Lamp')
Lamp=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

#############
####Pesk

#tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/Pesk')
#Pesk=Cor_Dist_SameModality(Raw,tEmbed,PointLab)

##########
##PCA

tEmbed=readRDS('~/Clean_Multiomics/Fixed-7/Embeddings/PrComp')
PCA=Cor_Dist_SameModality(Raw,tEmbed,PointLab)
