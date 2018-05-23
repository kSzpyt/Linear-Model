library(units)
library(udunits2)
dane3 <- read.csv("cars.csv")


dane3$mpg <- set_units(dane3$mpg, mile/gallon)
#dane3$mpg <- set_units(dane3$mpg, gallon/mile)
units(dane3$mpg) <- with(ud_units, l/km)
dane3$mpg <- as.numeric(dane3$mpg) * 100 
#units(dane3$mpg) <- with(ud_units, "l/100km")
dane3$mpg <- format(round(dane3$mpg, 2))

dane3$displacement <- set_units(dane3$displacement, inch^3)
units(dane3$displacement) <- with(ud_units, l)

dane3$weight <- set_units(dane3$weight, pound)
units(dane3$weight) <- with(ud_units, kg)

dane3$acceleration <- set_units(dane3$acceleration, s)

dane3$mpg <- as.numeric(dane3$mpg)

write.csv(dane3, file = "dane mpg.csv")


dane3 <- read.csv("cars.csv")


#dane3$mpg <- set_units(dane3$mpg, mile/gallon)
dane3$mpg <- set_units(dane3$mpg, gallon/mile)
#units(dane3$mpg) <- with(ud_units, l/km)
dane3$mpg <- as.numeric(dane3$mpg) * 100 
#units(dane3$mpg) <- with(ud_units, "l/100km")
dane3$mpg <- format(round(dane3$mpg, 2))

dane3$displacement <- set_units(dane3$displacement, inch^3)
units(dane3$displacement) <- with(ud_units, l)

dane3$weight <- set_units(dane3$weight, pound)
units(dane3$weight) <- with(ud_units, kg)

dane3$acceleration <- set_units(dane3$acceleration, s)

dane3$mpg <- as.numeric(dane3$mpg)

write.csv(dane3, file = "dane gpm.csv")










s













#co tu się
dane3 <- read.csv("cars.csv")

xx <- set_units(60, mile/h)
units(xx) <- with(ud_units, "meter/s")

yy <- set_units(100, km/h)
units(yy) <- with(ud_units, "meter/s")

xx-yy

dane3$acceleration <- set_units(dane3$acceleration, s)


m <- xx/dane3$acceleration[1]
k <- yy/dane3$acceleration[1]

m
k

units(m) <- with(ud_units, "mile/h/s")
units(k) <- with(ud_units, "km/h/s")

m
k

60/as.numeric(m)
100/as.numeric(k)
#to ja nawet nie











