#《R实战》
#功效分析
library(pwr)

pwr.t.test(d = .8, sig.level = .05, power = .9, type = "two.sample",
           alternative = "two.sided")


#draw_fig
set.seed(1234)
n <- 10000
mydata <- matrix(rnorm(n, mean = 0, sd = .5), ncol = 2)
mydata <- as.data.frame(mydata)
names(mydata) <- c("x", "y")
with(mydata, 
     smoothScatter(x, y, main = "Scatter Plot Colored by Smoothed Densities"))

install.packages("hexbin")
#六边形
library(hexbin)
with(mydata, {
  bin <- hexbin(x, y, xbins = 50)
  plot(bin, main = "Hexagonal binning with 10,000 observations")
})
#三维散点图
install.packages("scatterplot3d")
library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt, disp, mpg, 
              main = "Basic 3D scatter plot")
#折线图
opar <- par(no.readonly = T)
par(mfrow= c(1, 2))
t1 <- subset(Orange, Tree == 1)
plot(t1$age, t1$circumference,
     xlab = "Age (days)",
     ylab = "Circumference",
     main = "Orange Tree 1 growth")
plot(t1$age, t1$circumference,
     xlab = "Age (days)",
     ylab = "Circumference",
     main = "Orange Tree 1 growth",
     type = "b")
#相关图
options(digits= 2)
cor(mtcars)
library(corrgram)
corrgram(mtcars, order = T, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt,
         main = "corrgram of mtcars intercorrelations")
