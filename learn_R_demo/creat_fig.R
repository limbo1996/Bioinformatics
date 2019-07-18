######画图：条新股  直方图 箱线图 点图
#fig
install.packages("vcd")
library(vcd)
height
counts <- table(Arthritis$Improved)
counts
barplot(counts,
        main = "Simple Bar Plot",
        xlab = "Improvement", ylab = "Frequency")
#水平
barplot(counts,
        main = "Simple Bar Plot",
        xlab = "Improvement", ylab = "Frequency",
        horiz = TRUE)
#堆砌
counts <- table(Arthritis$Improved, Arthritis$Treatment)
barplot(counts,
        main = "Simple Bar Plot",
        xlab = "Improvement", ylab = "Frequency",
        col = c('red', 'yellow', 'green'),
        legend = rownames(counts))
#分组
barplot(counts,
        main = "simple bar plot",
        xlab = 'improvement', ylab = 'frequency',
        col = c('blue', 'yellow', 'green'),
        legend = rownames(counts), beside = T)
#均值
means <- aggregate(states$Illiteracy, by = list(state.region), FUN = mean)

means <- means[order(means$x),]
means
barplot(means$x, names.arg = means$Group.1)
title('mean illiteracy rate')

#微调
par(mar = c(5, 8, 4, 2))
counts <- table(Arthritis$Improved)
barplot(counts,
        main = "test",
        horiz = T,
        cex.names = 0.8)
#直方图
par(mfrow = c(2, 2))
hist(mtcars$mpg)
hist(mtcars$mpg,
     breaks = 12,
     col = 'red',
     xlab = "miles per gallon",
     main = 'colored histogram with 12 bins')

hist(mtcars$mpg,
     freq = F,
     breaks = 12,
     col = 'red',
     xlab = 'miles per gallons',
     main = 'histogram. rug plot, density curve')
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col = 'blue', lwd = 2)

x <- mtcars$mpg
h <- hist(x,
          breaks = 12,
          col = 'red',
          xlab = "miles per gallon",
          main = 'histogram with normal curve and box')
xfit <- seq(min(x), max(x), length = 40)
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col = "blue", lwd = 2)
box()


#核密度图
par(mfrow = c(2, 1))
d <- density(mtcars$mpg)
plot(d)
plot(d, main = "Kernel Density of Mile Per Gallon")
polygon(d, col = 'red', border = 'blue')
rug(mtcars$mpg, col = 'brown')
library(sm)


attach(mtcars)
cyl.f <- factor(cyl, levels = c(4, 6, 8),
                labels = c('4 cylinder', '6 cylinder', '8 cylinder'))
sm.density.compare(mpg, cyl, xlab = "miles per gallon")  
title(main = 'MPG Distribution by Car Cylinders')

colfill <- c(2:(1 + length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill = colfill)

detach(mtcars)

#箱线图
boxplot(mtcars$mpg, main = "Box Plot", ylab = "Miles Per Gallon")
boxplot.stats(mtcars$mpg)

boxplot(mtcars$mpg ~ mtcars$cyl, data = mtcars,
        main = "Car Mileage Data",
        xlab = "Number of Cylinders",
        ylab = 'Miles Per Gallon')


boxplot(mtcars$mpg ~ mtcars$cyl, data = mtcars,
        notch = T,
        varwidth = T,
        col = 'red',
        main = 'Car Mileage Data', 
        xlab = 'number of cylinder',
        ylab = 'miles per gallon')

mtcars$cyl.f <- factor(mtcars$cyl,
                       levels = c(4, 6, 8),
                       labels = c('4', '6', '8'))
mtcars$am.f <- factor(mtcars$am,
                      levels = c(0, 1),
                      labels = c('quto', 'standard'))
boxplot(mpg ~ am.f * cyl.f,
        data = mtcars,
        varwidth = T,
        col = c('gold', 'darkgreen'),
        main = 'MPG Distribution by auto type',
        xlab = 'Auto Type', ylab = 'Miles Per Gallon')
# 点图
dotchart(mtcars$mpg, labels = row.names(mtcars), cex = .7,
         main = 'gas mileage for car models',
         xlab = 'miles per gallon')

x <- mtcars[order(mtcars$mpg), ]
x$cyl <- factor(x$cyl)
x$color[x$cyl == 4] <- 'red'
x$color[x$cyl == 6] <- 'blue'
x$color[x$cyl == 8] <- 'darkgreen'

dotchart(x$mpg,
         labels = row.names(x),
         cex = .7,
         groups = x$cyl,
         gcolor = 'black',
         color = x$color,
         pch = 19,
         main = 'gas mileage for car models\nground by cylinder',
         xlab = 'miles per gallon')

