#purpose: to process the CLL dataset

load('~/Clean_Multiomics/CLL/CLL_data.RData')

for(i in 1:length(CLL_data)){

meanVal=mean(CLL_data[[i]],na.rm=TRUE)
naInds=which(is.na(CLL_data[[i]]))
CLL_data[[i]][naInds]=meanVal
}

AllX=cbind(scale(t(CLL_data[[1]])),scale(t(CLL_data[[2]])),scale(t(CLL_data[[3]])),scale(t(CLL_data[[4]])))

PointLab=rep(c(1,2,3,4),times=c(nrow(CLL_data[[1]]),nrow(CLL_data[[2]]),nrow(CLL_data[[3]]),nrow(CLL_data[[4]])))
