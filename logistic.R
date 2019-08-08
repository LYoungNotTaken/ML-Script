#a
data <- data.frame(Default)

for (i in 1:10000) {
  if (data$student[i] == 'No') {
    data$default[i] = 0
  } else {
    data$default[i] = 1
  }
}
data$default <- sapply(data$default, as.numeric)
glm.model = glm(data$default ~ data$balance + data$income, family = binomial(link = 'logit'), data = data)
summary(glm.model)

#b
boot.fn <- function(data, index) {
  d <- data[index, ]
  model = lm(formula = d$default ~ d$balance + d$income, data = d)
  return(model$coef)
}

#c
set.seed(1234)
result <- boot(data = data,
               statistic = boot.fn,
               R = 10000)
print(result)
