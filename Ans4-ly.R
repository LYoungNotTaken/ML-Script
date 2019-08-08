#1cubicPolyRegression

install.packages("MASS") #install package
library(MASS)
linearFit = lm(nox ~ poly(dis, 3), data = Boston)
summary(linearFit)

library(MASS)
attach(Boston)
conf_interval <- predict(linearFit, interval="confidence", level = 0.95) #plot confidence interval of prediction of regression
plot(dis, nox, xlab="dis", ylab="nox", main="Regression")
lines(conf_interval[,1], col = "blue")
lines(conf_interval[,2], col = "red", lty = "dotted")
lines(conf_interval[,3], col = "red", lty = "dotted")

#3crossValidation

cv.error.10 = rep(0, 10) #change the number to do the cross-validation
for (i in 1:10) {
  glm.fit = glm(nox ~ poly(dis, i), data = Boston)
  cv.error.10[i] = boot::cv.glm(Boston, glm.fit, K = 10)$delta[2]
}
cv.error.10

plot(1:10, cv.error.10, xlab = "Degree", ylab = "CV error", type = "l")

#2polynominalDegreeRegression



ithLinearFit = lm(nox ~ poly(dis, 2), data = Boston) #repeat this segment for 5 times while change the index 1 to 5
dislim = range(dis)
dis.grid = seq(from = dislim[1], to = dislim[2], by = 0.1)
lm.pred = predict(ithLinearFit, list(dis = dis.grid))
plot(nox ~ dis, data = Boston, col = "darkgrey")
lines(dis.grid, lm.pred, col = "red", lwd = 2)


#4smoothSpline

library(splines)

line12 <- smooth.spline(dis, nox, df = 12)
plot(dis, nox,cex=1,col="grey")
lines(line12, col = "red")

line13 <- smooth.spline(dis, nox, df = 13)
lines(line13, col = "blue")

line14 <- smooth.spline(dis, nox, df = 14)
lines(line14, col = "green")

legend(10, 0.8, legend=c("df 12", "df 13", "df 14"), col=c("red", "blue", "green"), lty=1, cex=1)

