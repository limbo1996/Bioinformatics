#中级绘图
#散点图
attach(mtcars)
plot(wt, mpg,
     main = 'Basic Scatter plot of MPG vs. Weight',
     xlab = 'Car Weight (1bs/1000)',
     ylab = 'Mile Per Gallon', pch = 19)
abline(lm(mpg ~ wt), col ='red', lwd = 2, lty = 1)
lines(lowess(wt,mpg), col = 'blue', lwd = 2, lty = 2)
#复杂的散点图
library(car)
scatterplot(mpg ~ wt | cyl, data = mtcars, lwd = 2, span = 0.75,
            main = "Scatter Plot of MPG vs. Weight by # Cylinders",
            xlab = "Weight of car (1bs/1000)",
            ylab = "Miles Per Gallon",
            legend.plot = TRUE,
            id.method = "identify",
            boxplots = "xy"
)
#散点图矩阵
#基础散点图矩阵
pairs(~mpg + disp + drat + wt, data = mtcars,
      main = 'Basic Scatter Plot Matrix',
      #upper.panel = NULL)
#复杂散点图矩阵
scatterplotMatrix(~ mpg + disp + drat + wt, data = mtcars,
                  spread = F, smoother.arg = list(lty = 2),
                  main = 'Scatter Plot Matrix via car Package')

#高密度散点图
