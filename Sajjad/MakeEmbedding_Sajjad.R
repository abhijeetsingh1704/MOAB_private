Raw=readRDS('~/Clean_Multiomics/Sajjad/AllX_Sajjad')
PointLab=readRDS('~/Clean_Multiomics/Sajjad/PointLab')
Raw=t(Raw)

#UMAP
#UMapRes=umap(Raw)
UMAP=UMapRes$layout
print('done with UMAP')

#largeVis
LVRes=largeVis(t(Raw))
LargeVis=LVRes$coords

