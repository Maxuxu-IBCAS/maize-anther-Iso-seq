myfile <- list.files()
txtfile <- myfile[grep(myfile, pattern = ".ctss$")]
library(CAGEr)

myCAGEset <- new("CAGEset", genomeName = "NULL", inputFiles = txtfile, inputFilesType = "ctss",sampleLabels = c("A10","A15_30","A40","APO"))
getCTSS(myCAGEset)
ctss <- CTSStagCount(myCAGEset)
sampleLabels(myCAGEset)
normalizeTagCount(myCAGEset, method = "powerLaw",fitInRange = c(5, 1000), alpha = 1.05, T = 1*10^7)
clusterCTSS(object = myCAGEset, threshold = 0.5, thresholdIsTpm = TRUE, nrPassThreshold = 1, method = "distclu", maxDist = 24, removeSingletons = TRUE, keepSingletonsAbove = 3)

cumulativeCTSSdistribution(myCAGEset, clusters = "tagClusters", useMulticore = T)
quantilePositions(myCAGEset, clusters = "tagClusters", qLow = 0.1, qUp = 0.9)
aggregateTagClusters(myCAGEset, tpmThreshold = 0.5, qLow = 0.1, qUp = 0.9, maxDist = 24)
write.table(consensusClustersGR(myCAGEset, sample = "A15_30"),file = "A15_30_1_A.combined.csv",sep = "\t")
write.table(consensusClustersGR(myCAGEset, sample = "A40"),file = "A40_1_A.combined.csv",sep = "\t")
write.table(consensusClustersGR(myCAGEset, sample = "A10"),file = "A10_1_A.combined.csv",sep = "\t")
write.table(consensusClustersGR(myCAGEset, sample = "APO"),file = "APO_1_A.combined.csv",sep = "\t")
