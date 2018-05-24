dane <- read.csv("dane mpg.csv")
dane <- dane[,c(-1, -8, -9, -10)]
source("Hellwig Method.R")
as.matrix(hellwig(dane[, 1], dane[, -1]))


model <- lm(lp100km ~ horsepower + weight, dane)
cor(dane$horsepower, dane$weight)
summary(model)
res <- model$residuals

shapiro.test(res)
jarque.bera.test(res)
# jak reszty nie są normalne to pizda str 50-51 testy pdf

sum <- summary(model)
str(sum)
sum$r.squared# wsp determinacji wysoki czyli sztos, dobre dopasowanie modelu
library(lmtest)
bp <- bptest(sum)


resettest(model, type = "regressor", data = dane)

model$coefficients


s <- summary(model)
s <- s$coefficients

s[2, 1] + qnorm(c(.05, .95)) * s[2, 2]
s[2, 1] + qnorm(c(.025, .975)) * s[2, 2]
s[2, 1] + qnorm(c(.005, .995)) * s[2, 2]


model2 <- lm(lp100km ~ log10(horsepower) + log10(weight), dane)

q <- summary(model2)
q <- q$coefficients
q

q[2, 1] + qnorm(c(.05, .95)) * q[2, 2]
q[2, 1] + qnorm(c(.025, .975)) * q[2, 2]
q[2, 1] + qnorm(c(.005, .995)) * q[2, 2]



coef(model)





