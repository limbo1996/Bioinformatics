setwd('C:/data')
sample <- Sys.glob('*.pbs')

j <- 1
for (i in sample) {
   test1[j] <- substr(basename(i), start = 1, stop = 12)
   j <- j + 1
}
result <- data.frame(normal <- sample, stringsAsFactors = FALSE)
write.csv(result, file = "result.CSV", quote = FALSE, row.names = FALSE)