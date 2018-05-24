dane <- read.csv("dane mpg.csv")
dane <- dane[,c(-1, -8, -9, -10)]
source("Hellwig Method.R")
hellwig(dane[, 1], dane[, -1])

dane2 <- read.csv("dane gpm.csv")
dane2 <- dane2[,c(-1, -9, -10)]
source("Hellwig Method.R")
hellwig(dane2[, 1], dane2[, -1])

library(EnvStats)
d <- read.csv("dane mpg.csv")
d <- d[,c(-1, -9, -10)]

down <- lm(lp100km ~ 1, d)
up <- lm(lp100km ~ ., d)


model <- lm(lp100km ~ horsepower + weight, d)
str(model)

step(down, direction = "both", scope = list(upper=up))


library(leaps)
l <- regsubsets(mpg ~ cylinders + displacement + horsepower + weight + acceleration + year, d, nbest = 20)
plot(l, scale="bic")


mm <- lm(mpg ~ horsepower + weight, dane)

shapiro.test(mm$residuals)
library(tseries)
library(BSDA)
library(EnvStats)
jarque.bera.test(mm$residuals)







