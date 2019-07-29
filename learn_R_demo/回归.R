#第七章统计分析
myvars <- c('mpg', 'hp', 'wt')
head(mtcars[myvars])
summary(mtcars[myvars])#总结结果包含四分位点，平均数
mystats <- function(x, na.omit = F){
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x - m) ^ 3 / s ^ 3) / n
  kurt <- sum((x - m) ^ 4 / s ^ 4) / n
  return(c(n = n, mean = m, stdev = s, skew = skew, kurt = kurt))
}  

sapply(mtcars[myvars], mystats)
library(Hmisc)
describe(mtcars[myvars])


#T检验

#独立样本T检验
t.test(Prob ~ So, data = UScrime)
#非独立样本T检验
sapply(UScrime[c('U1', 'U2')], function(x)(c(mean = mean(x), sd = sd(x))))
View(UScrime)
with(UScrime, t.test(U1, U2, paired = T))

#第八章回归
#简单线性回归

fit <- lm(weight ~ height, data = women)
summary(fit)
women$weight#真实值
fitted(fit)#预测值
residuals(fit)#残差
plot(women$height, women$weight, 
     xlab = "Height (in inches)", 
     ylab = "Weigrh (in pounds)")
abline(fit)

#多项式回归
#添加一个二项式来提高回归的精确度
fit2 <- lm(weight ~ height + I(height ^ 2), data = women)
summary(fit2)
plot(women$height, women$weight,
     xlab = "Height (in inches)", 
     ylab = "Weight (lbs)")
lines(women$height, fitted(fit2))
#图上可以看出拟合的更好
#n次多项式生成n - 1 个曲线
#拟合三次多项式
fit3 <- lm(weight ~ height + I(height ^ 2) + I(height ^ 3), data = women)
library(car)
scatterplot(weight ~ height, data = women,
            spread = F, smoother.args = list(lty = 2), pch = 19,
            main = "Women Age 30-39",
            xlab = "Height (inches)",
            ylab = "Weight (lbs.)")


#多元线性回归
#预测的变量不止一个的时候就为多元线性回归
states <- as.data.frame(state.x77[, c('Murder', 'Population', 'Illiteracy', 'Income', 'Frost')])
#检查变量相关性
cor(states)
library(car)
scatterplotMatrix(states, spread = F, smoother.arg = list(lty = 2), main = 'Scatter Plot Matrix')#相关性点图
#拟合
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
summary(fit)
#Call:
#  lm(formula = Murder ~ Population + Illiteracy + Income + Frost, 
#     data = states)
#
#Residuals:
#  Min      1Q  Median      3Q     Max 
#-4.7960 -1.6495 -0.0811  1.4815  7.6210 

#Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 1.235e+00  3.866e+00   0.319   0.7510    
#Population  2.237e-04  9.052e-05   2.471   0.0173 *  
#Illiteracy  4.143e+00  8.744e-01   4.738 2.19e-05 ***
#Income      6.442e-05  6.837e-04   0.094   0.9253    
#Frost       5.813e-04  1.005e-02   0.058   0.9541    
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 2.535 on 45 degrees of freedom
#Multiple R-squared:  0.567,	Adjusted R-squared:  0.5285 
#F-statistic: 14.73 on 4 and 45 DF,  p-value: 9.133e-08

#有交互项的多元线性回归
fit2 <- lm(mpg ~ hp + wt + hp:wt, data = mtcars)
summary(fit2)
#Call:
#  lm(formula = mpg ~ hp + wt + hp:wt, data = mtcars)
#
#Residuals:
#  Min      1Q  Median      3Q     Max 
#-3.0632 -1.6491 -0.7362  1.4211  4.5513 
#
#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 49.80842    3.60516  13.816 5.01e-14 ***
#hp          -0.12010    0.02470  -4.863 4.04e-05 ***
#wt          -8.21662    1.26971  -6.471 5.20e-07 ***
#hp:wt        0.02785    0.00742   3.753 0.000811 ***
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 2.153 on 28 degrees of freedom
#Multiple R-squared:  0.8848,	Adjusted R-squared:  0.8724 
#F-statistic: 71.66 on 3 and 28 DF,  p-value: 2.981e-13




#图形展示交互项
library(effects)
plot(effect("hp:wt", fit2,, list(wt = c(2.2, 3.2, 4.2))), multiline = T)
#回归诊断
confint(fit)
#                2.5 %       97.5 %
#(Intercept) -6.552191e+00 9.0213182149
#Population   4.136397e-05 0.0004059867
#Illiteracy   2.381799e+00 5.9038743192
#Income      -1.312611e-03 0.0014414600
#Frost       -1.966781e-02 0.0208304170
##回归诊断基础方法
fit3 <- lm(weight ~ height, data = women)
par(mfrow = c(2, 2))
plot(fit3)



fit4 <- lm(weight ~ height + I(height ^ 2), data = women)
par(mfrow = c(2, 2))
plot(fit4)



par(mfrow = c(2, 2))
plot(fit)
##回归诊断改进后的方法car包
library(car)
#正态性
qqPlot(fit, labels = row.names(states), id.method = "identify", simulate = T, main = "Q - Q Plot")


#残差
residplot <- function(fit, nbreaks = 10){
  z <- rstudent(fit)
  hist(z, breaks = nbreaks, freq = F,
       xlab = "Studentized Residual",
       main = "Distribution of Error")
  rug(jitter(z), col = "brown")
  curve(dnorm(x, mean = mean(z), sd = sd(z)),
        add = T, col = "blue", lwd = 2)
  lines(density(z)$x, density(z)$y,
        col = "red", lwd = 2, lty = 2)
  legend("topright", legend = c("Normal Curve", "Kernel Density Curve"),
         lty = 1:2, col = c('blue', 'red'), cex = .7)
  
}
residplot(fit)
#误差独立性
durbinWatsonTest(fit)
#lag Autocorrelation D-W Statistic p-value
#1      -0.2006929      2.317691    0.23
#Alternative hypothesis: rho != 0




















