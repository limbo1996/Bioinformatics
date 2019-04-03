setwd("C:/Users/Limbo/Desktop")
problem_id <- read.csv("problemid.csv", header = TRUE, sep = ",")
test <- readLines('test.txt', encoding = 'UTF-8')



#«??????“I˜a³???“I•ª???
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
#«??????”˜‰ü³
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

#Å@??????
new_test <- union(test_r, new_test_r)


























