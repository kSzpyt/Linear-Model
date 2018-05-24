#metody boostrapowe str 26
#bootsrap
dane <- read.csv("dane mpg.csv")

par_horsepower <- rep(NA, 10 ^ 5)
par_weight <- rep(NA, 10 ^ 5)

for(i in 1:10^5){
  boot_sample <- sample(1:nrow(dane), 
                        nrow(dane), 
                        replace = T)
  model <- lm(lp100km ~ horsepower + weight, 
              data = dane[boot_sample, c(2, 5, 6)])
  par_horsepower[i] <- coef(model)[2]
  par_weight[i] <- coef(model)[3]
}

#90%
quantile(par_horsepower, c(0.05, 0.95))

#95%
quantile(par_horsepower, c(0.025, 0.975))

#99%
quantile(par_horsepower, c(0.005, 0.995))
###############################
#90%
quantile(par_weight, c(0.05, 0.95))

#95%
quantile(par_weight, c(0.025, 0.975))

#99%
quantile(par_weight, c(0.005, 0.995))