dane <- read.csv("cars.csv")
x<-dane$mpg*3.79/1.61
dane2 <- dane
dane2$mpg <- x
dane2
colnames(dane2)[1] <- "lpk"
str(dane)
x <- dane$displacement*2.54
dane2$displacement <- x

x<- dane$weight*0.45
dane2$weight <- x

x <- dane$acceleration*1.61
dane2$acceleration <- x


dane2

write.csv(dane2, file = "dane2.csv")

ud.convert()

library(units)

a <- 10
a <- set_units(10, m/s)
b <- a
units(b) <- with(ud_units, km/h)
b
