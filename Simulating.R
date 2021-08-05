library(splatter)
library(scater)
library(scBatch)
library(rgl)

nGroups=5
nGenes=1000
batchCells=2000
dropout=3
cell_num=2000
drop_out=4
if (nGroups > 1) method <- 'groups'else             method <- 'single'

group.prob <- rep(1, nGroups) / nGroups

# new splatter requires dropout.type
if ('dropout.type' %in% slotNames(newSplatParams())) {
  if (dropout)
    dropout.type <- 'experiment'
  else
    dropout.type <- 'none'
  
  sim <- splatSimulate(group.prob=group.prob, nGenes=nGenes, batchCells=c(batchCells/4,batchCells/4,batchCells/4,batchCells/4),
                       dropout.type=dropout.type, method=method,batch.facLoc=c(0.001,0.001,0.001,0.001),
                       batch.facScale=c(0.001,0.001,0.001,0.001),
                       seed=0, dropout.shape=-1, dropout.mid=dropout)
  
} else {
  sim <- splatSimulate(group.prob=group.prob, nGenes=nGenes, batchCells=c(batchCells/4,batchCells/4,batchCells/4,batchCells/4),
                       dropout.present=!dropout, method=method,batch.facLoc=c(0.001,0.001,0.001,0.001),
                       batch.facScale=c(0.001,0.001,0.001,0.001),
                       seed=0, dropout.shape=-1, dropout.mid=dropout)        
}

sim<- logNormCounts(sim)


batch = sim@colData$Batch
cell.type = sim@colData$Group
exp <- exprs(sim)
