dane <- read.csv("dane mpg.csv")
dane <- dane[,c(-1, -9, -10)]
s <- sapply(dane, sd)
m <- sapply(dane, mean)
s/m
