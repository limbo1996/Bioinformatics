setwd('C:/data')
sample <- Sys.glob('*.pbs')

j <- 1
for (i in sample) {
   test[j] <- substr(basename(i), start = 1, stop = 12)
   j <- j + 1
}

write.table(test, file = "sample.txt", sep = " ")