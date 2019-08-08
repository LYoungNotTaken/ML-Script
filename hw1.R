qfunc

?ecdf
>
> Fn <- ecdf(x)
> Fn     # a *function*
Empirical CDF 
Call: ecdf(x)
x[1:12] = -1.6929, -0.86244, -0.57796,  ..., 0.77649, 2.3657
> Fn(x)  # returns the percentiles for x
[1] 0.41666667 0.08333333 1.00000000 0.50000000 0.58333333 0.83333333
[7] 0.91666667 0.66666667 0.75000000 0.25000000 0.33333333 0.16666667
> F10 <- ecdf(rnorm(10))
> summary(F10)
Empirical CDF:	  10 unique values with summary
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-1.1466 -0.8954 -0.3786 -0.1642  0.2187  1.8892 
> 
  > plot(F10)
> plot(F10, verticals = TRUE, do.points = FALSE)

data_2 <- data.frame(data_2)
col7 <- data_2[,7]
Fn <- ecdf(col7)

plot(Fn)
plot(Fn, verticals = TRUE, do.points = FALSE)

group1 <- c()
group2 <- c()
group3 <- c()
group4 <- c()
group5 <- c()

index1 = 1
index2 = 1
index3 = 1
index4 = 1
index5 = 1

for (n in 1:2040) {
  if (data_2[n,2]==1){
    group1[index1]=data_2[n,7]
    index1=index1+1
  }
  if (data_2[n,2]==2){
    group2[index2]=data_2[n,7]
    index2=index2+1
  }
  if (data_2[n,2]==3){
    group3[index3]=data_2[n,7]
    index3=index3+1
  }
  if (data_2[n,2]==4){
    group4[index4]=data_2[n,7]
    index4=index4+1
  }
  if (data_2[n,2]==5){
    group5[index5]=data_2[n,7]
    index5=index5+1
  }
}


data_2 <- data.frame(data_2)
col6 <- data_2[,6]
Fn <- ecdf(col6)

plot(Fn)
plot(Fn, verticals = TRUE, do.points = FALSE)

data_2 <- data.frame(data_2)
col10 <- data_2[,10]
Fn <- ecdf(col10)

plot(Fn)
plot(Fn, verticals = TRUE, do.points = FALSE)

trainum = c(1:450,485:750)
testnum = c(451:484,751:784)
newdata1 = data_2[trainum,]
newdata2 = data_2[testnum,]

logistic <- glm((newdata1[,2]-1)~ newdata1[,3]+newdata1[,4]+newdata1[,5]+newdata1[,6]+newdata1[,7]+newdata1[,8]+newdata1[,9]+newdata1[,10]+newdata1[,11]+newdata1[,12]+newdata1[,13]+newdata1[,14], family = binomial(link='logit'), data = newdata1)
traindata = data.frame(newdata1[,7])

preTrain = predict(logistic, newdata1 = traindata, type = "response")

raw = data.frame(newdata2[,2] - 1)
correction <- 0
false <- 0
for (i in 1:length(raw)) {
  if (((raw[i] == 0) & (preTrain[i] < 0.5)) | ((raw[i] == 1) & (preTrain[i] >= 0.5))) {
    correction <- correction + 1
  } else {
    false <- false + 1
  }
}

summary(logistic)
accuracy <- correction / (correction + false)
accuracy


n2col7 = 100 - col7
log202col7 = log(n2col7, base = 10)
hist(log202col7,breaks = 20)
shapiro.test(log202col7)

dgroup1 = 100 - group1
ngroup1 = log(dgroup1, base = 10)
hist(ngroup1,breaks = 20)
shapiro.test(ngroup1)

dgroup2 = 100 - group2
ngroup2 = log(dgroup2, base = 10)
hist(ngroup2,breaks = 20)
shapiro.test(ngroup2)

dgroup3 = 100 - group3
ngroup3 = log(dgroup3, base = 10)
hist(ngroup3,breaks = 20)
shapiro.test(ngroup3)

dgroup4 = 100 - group4
ngroup4 = log(dgroup4, base = 10)
hist(ngroup4,breaks = 20)
shapiro.test(ngroup4)

bartlett.test(ave_age~category, data = data_2)
dgroup5 = 100 - group5
ngroup5 = log(dgroup5, base = 10)
hist(ngroup5,breaks = 20)
shapiro.test(ngroup5)

aovage =aov(newage ~ category, data = data3)
summary(aovage)


hist(data_2[,3],breaks = 30)