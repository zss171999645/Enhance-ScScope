library(sva)
library(bladderbatch)
BiocManager::install('sva' ) 
ainstall.packages("sva")


batch1 <- rep(1,times=500)
batch2 <- rep(2,times=500)
batch3 <- rep(3,times=500)
batch4 <- rep(4,times=500)
batch.type <- as.factor(c(batch1,batch2,batch3,batch4)) 
expr_batch <- ComBat(dat = t(counts),batch = cellinfo$Batch)
write.csv(t(expr_batch), file =paste("C://Users//ZhouFeng//Desktop//Ъюба//group//ScBatch//data//fuckcounts.csv",sep="") )
write.csv(t(counts), file =paste("C://Users//ZhouFeng//Desktop//Ъюба//group//ScBatch//data//fuckBeforecounts.csv",sep="") )
