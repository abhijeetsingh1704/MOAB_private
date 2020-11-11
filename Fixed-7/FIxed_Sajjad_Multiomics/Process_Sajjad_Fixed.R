#Process_Sajjad
source('~/Dropbox/GrassmanSubspace/GrassmanEmbed.R')
source('~/Dropbox/AttributeAlign/TestAlignment.R')
source('~/Dropbox/MV_Feat_Sel/Multiomics/SampleEmbedding.R')

#load the data
Dat=load('~/Dropbox/FIxed_Sajjad_Multiomics/Data_fixed.RDA')

DataSetNames=c('Cellfree RNA','PlasmaLuminex','SerumLuminex','Microbiome','ImmuneSystem','Metabolomics', 'PlasmaSomalogic')

Xs=list()
Xs[[1]]=scale(InputData[[1]])
Xs[[2]]=scale(InputData[[2]])
Xs[[3]]=scale(InputData[[3]])
Xs[[4]]=scale(InputData[[4]])
Xs[[5]]=scale(InputData[[5]])
Xs[[6]]=scale(InputData[[6]])
Xs[[7]]=scale(InputData[[7]])


#fix NaN inds
Vars=apply(InputData[[1]],2,var)
#find 0 var
Var0Inds=which(Vars==0)
Xs[[1]]=Xs[[1]][,-Var0Inds]

AllX=cbind(Xs[[1]], Xs[[2]], Xs[[3]],Xs[[4]],Xs[[5]],Xs[[6]],Xs[[7]])
AllX=t(AllX)
nodelabs=rep(1:7,times=c(ncol(Xs[[1]]),ncol(Xs[[2]]),ncol(Xs[[3]]),ncol(Xs[[4]]),ncol(Xs[[5]]),ncol(Xs[[6]]),ncol(Xs[[7]])))
