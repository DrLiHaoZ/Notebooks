library(MASS)
library(ISLR)
names(Boston)
head(Boston)

lm.fit <- lmObj <- lm(medv ~ lstat, data = Boston)
lm.fit
summary(lm.fit)

