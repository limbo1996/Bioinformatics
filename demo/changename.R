#setwd("C:/Users/Limbo/Desktop")
library(data.table)
problem_id <- data.table::fread("demo/problem_id.txt")
data.table::setDF(problem_id)
map = problem_id[, c(4, ncol(problem_id))]
colnames(map) = c("filename", "barcode")
map$barcode = paste0(map$barcode, ".bam")

bai_df = map
bai_df$filename = sub("bam", "bai", bai_df$filename)
bai_df$barcode = sub("bam", "bai", bai_df$barcode)

map = rbind(map, bai_df)
map$filename = paste0("/public/home/liuxs/biodata/gdc/links/TCGA_NSCLC/", map$filename)
map$barcode = paste0("/public/home/wangshx/wx/nsclc_links/", map$barcode)

save(map, file="map.RData")


load("map.RData")

for (i in 1:nrow(map)) {
  cmd = paste("ln -s", map[i, 1], map[i, 2])
  #print(cmd)
  system(cmd)
}





problem_id <- read.csv("problemid.csv", header = TRUE, sep = ",")
test <- readLines('test.txt', encoding = 'UTF-8')



#?????????I?a??????I?????
test_e <- vector('character')
test_r <- vector('character')
new_test_r <- vector('character', length(test_e))
j <- 1
k <- 1
for (i in seq_along(test)) {
  if (as.character(substr(test[i], 1, 3)) == "abc") {
    test_e[j] <- test[i]
    j <- j + 1
  }
  else{
    test_r[k] <- test[i]
     k <- k + 1
  }
}
#????????????????
x <- as.character(problem_id[, 1])
y <- as.character(problem_id[, 3])
n <- 1
for (i in seq_along(test_e)){
   for (m in seq_along(x)){
     if (test_e[i] == x[m]){
       new_test_r[n] <- y[m]
       n <- n + 1
     } 
   }
}    

#?ō@??????
new_test <- union(test_r, new_test_r)


























