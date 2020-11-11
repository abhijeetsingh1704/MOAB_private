#ProcessTCGAMO
#This is for analyzing TCGA data miRNA, methylation, RNA seq
#library('Rtsne')
miRNA=read.csv('~/Dropbox/Multiomics_TCGA/Human__TCGA_ACC__BDGSC__miRNASeq__HS_miR__01_28_2016__BI__Gene__Firehose_RPM_log2.csv',header=TRUE,stringsAsFactors=FALSE)
methyl=read.csv('~/Dropbox/Multiomics_TCGA/Human__TCGA_ACC__JHU_USC__Methylation__Meth450__01_28_2016__BI__Gene__Firehose_Methylation_Prepocessor.csv',header=TRUE,stringsAsFactors=FALSE)
RNASeq=read.csv('~/Dropbox/Multiomics_TCGA/Human__TCGA_ACC__UNC__RNAseq__HiSeq_RNA__01_28_2016__BI__Gene__Firehose_RSEM_log2.csv',header=TRUE,stringsAsFactors=FALSE)

#find the common samples
miRNA=miRNA[,-5]
methyl=methyl[,-5]

rownames(miRNA)=miRNA[,1]
miRNA=miRNA[,-1]

rownames(methyl)=methyl[,1]
methyl=methyl[,-1]

rownames(RNASeq)=RNASeq[,1]
RNASeq=RNASeq[,-1]

#replace NA vals in the methylation dataset
out=rowSums(methyl)
delInds=which(is.na(out))
methyl=methyl[-delInds,]

#define a list
Xs=list()
Xs[[1]]=scale(t(miRNA))
Xs[[2]]=scale(t(methyl))
Xs[[3]]=scale(t(RNASeq))

AllX=cbind(Xs[[1]],Xs[[2]],Xs[[3]])
AllX=t(AllX)

nodelabs=rep(1:3,times=c(ncol(Xs[[1]]),ncol(Xs[[2]]),ncol(Xs[[3]])))

saveRDS(AllX,'~/Dropbox/Multiomics_TCGA/AllX')
saveRDS(nodelabs,'~/Dropbox/Multiomics_TCGA/nodelabs')
stop('')
#############
#end of the new processing stuff
#############


#figure out the highest variance features
Vars=apply(Xs[[2]],2,var)
OrderInds=order(Vars,decreasing=TRUE)[1:5000]
Xs[[2]]=Xs[[2]][,OrderInds]

Vars=apply(Xs[[3]],2,var)
OrderInds=order(Vars,decreasing=TRUE)[1:10000]
Xs[[3]]=Xs[[3]][,OrderInds]

NAInds=which(is.na(Xs[[2]]))
Xs[[2]][NAInds]=0

Xs[[1]]=scale(Xs[[1]])
Xs[[2]]=scale(Xs[[2]])
Xs[[3]]=scale(Xs[[3]])

MyCols=c('palevioletred1','lavenderblush2','burlywood1')

ColVec=c(rep(MyCols[1],ncol(Xs[[1]])),rep(MyCols[2],ncol(Xs[[2]])),rep(MyCols[3],ncol(Xs[[3]])))


#PCA evaluation
pc=prcomp(Xs[[1]])$x[,1:10]
pc=cbind(pc, prcomp(Xs[[2]])$x[,1:10], prcomp(Xs[[3]])$x[,1:10])

for (i in seq(length(Xs))){
    temp=matrix(NA, ncol(Xs[[i]]), ncol(pc))
    z=ncol(Xs[[i]])
    for (j in seq(ncol(Xs[[i]]))){
        for (k in seq(ncol(pc)))
            temp[j,k]=abs(cor(Xs[[i]][,j],pc[,k]))
    }
    if(i==1){
        ans=temp
        next
    }
    ans=rbind(ans,temp)
}

ts=Rtsne(ans,check_duplicates=FALSE)
lo=ts$Y
quartz()
plot(lo,cex=.4,pch=16,col=ColVec,xlab='dim1',ylab='dim2')
legend('bottomright',legend=c('miRNA','methylation','RNASeq'),fill=MyCols)
